import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Search Users (GET) & Follow (POST)")
q = st.text_input("Search query", placeholder="Jessic")
if st.button("Search"):
    try:
        results = api_get("/search/users", params={"q": q})
        st.dataframe(results, use_container_width=True, hide_index=True)
    except Exception as e:
        st.error(f"Error: {e}")

st.subheader("Follow a User (POST)")
follower_id = st.number_input("FollowerID", min_value=1, step=1)
followee_id = st.number_input("FolloweeID", min_value=1, step=1)
if st.button("Follow"):
    try:
        data = api_post("/follows", json={"follower_id": int(follower_id), "followee_id": int(followee_id)})
        st.success(f"Followed: {data}")
    except Exception as e:
        st.error(f"Error: {e}")
