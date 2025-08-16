import requests
import streamlit as st

API_URL = "http://web-api:4000/posts"

def fetch_posts():
    response = requests.get(API_URL)
    if response.status_code == 200:
        return response.json()
    else:
        st.write("Error fetching posts")
        st.error("Error fetching posts")
        return []

posts = fetch_posts()
st.write(posts)


# Shows a bunch of post previews, showing their title and a small snippet of their body
# Clicking on a post navigates to DetailedPost.py, using the post id