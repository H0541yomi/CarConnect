import streamlit as st
import requests
from streamlit import session_state

API_URL = "http://web-api:4000/posts/"

def fetch_posts():
    try:
        response = requests.get(API_URL)
        if response.status_code == 200:
            return response.json().get("posts", [])
        else:
            st.error(f"Failed to fetch posts: {response.status_code}")
            return []
    except Exception as e:
        st.error(f"Error fetching posts: {e}")
        return []

def show_post_preview(post):
    title = post.get("Title", "No Title")
    body = post.get("Body", "")
    snippet = body[:120] + ("..." if len(body) > 120 else "")
    st.markdown(f"### {title}")
    st.markdown(f"{snippet}")
    if st.button(f"View Details", key=f"view_{post.get('PostId')}"):
        st.session_state["selected_post"] = post.get("PostId")

def main():
    st.title("Posts Feed")
    posts = fetch_posts()
    if "selected_post" in st.session_state:
        # Redirect to DetailedPost.py
        st.switch_page("pages/DetailedPost.py")
    else:
        if not posts:
            st.info("No posts available.")
        for post in posts:
            show_post_preview(post)
            st.markdown("---")
            
    return posts

if __name__ == "__main__":
    main()