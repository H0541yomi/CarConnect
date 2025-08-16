import streamlit as st
import requests

API_URL = "http://web-api:4000/posts/"

def fetch_post(post_id):
    response = requests.get(f"{API_URL}/{post_id}")
    if response.status_code == 200:
        return response.json().get("PostInfo", {})
    return {}

def fetch_comments(post_id):
    response = requests.get(f"{API_URL}/{post_id}/comments")
    if response.status_code == 200:
        return response.json()
    return []

def main():
    post_id = st.session_state.get("selected_post")
    if not post_id:
        st.error("No post selected.")
        return

    post = fetch_post(post_id)
    comments = fetch_comments(post_id)

    # Extract fields
    username = post.get("AuthorUsername") or post.get("AdvertiserName") or "Anonymous"
    created_at = post.get("CreatedAt", "")
    title = post.get("Title", "No Title")
    body = post.get("Body", "")

    # Custom author/title/date formatting
    st.markdown(
        f"""
        <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: baseline;">
            <span style="font-size:1.5em; font-weight:600;">By {username}</span>
            <span style="font-size:0.9em; color: #888;">Posted on {created_at}</span>
        </div>
        """,
        unsafe_allow_html=True
    )
    st.markdown(f"## {title}")
    st.markdown(f"{body}")

    st.markdown("---")
    st.markdown("### Comments")
    if not comments:
        st.info("No comments yet.")
    else:
        for comment in comments:
            comment_author = comment.get("Author", "Anonymous")
            comment_body = comment.get("Body", "")
            comment_created = comment.get("CreatedAt", "")
            st.markdown(
                f"""
                <div style="display: flex; flex-direction: row; justify-content: space-between; align-items: baseline;">
                    <span style="font-size:1.1em; font-weight:500;">{comment_author}</span>
                    <span style="font-size:0.8em; color: #888;">{comment_created}</span>
                </div>
                <div style="margin-bottom: 1em;">{comment_body}</div>
                """,
                unsafe_allow_html=True
            )

if __name__ == "__main__":
    main()