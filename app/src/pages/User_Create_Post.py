import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Create Post (POST)")
with st.form("create_post"):
    user_id = st.session_state.get("UserId")
    title = st.text_input("Title", placeholder="My first build")
    body = st.text_area("Body", placeholder="What did you modify?")
    submitted = st.form_submit_button("Publish")
    if submitted:
        try:
            payload = {"author_id": user_id, "title": title, "body": body}
            data = requests.post("/posts", json=payload)
            st.success(f"Published: {data}")
        except Exception as e:
            st.error(f"Error: {e}")
