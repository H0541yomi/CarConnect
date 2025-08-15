import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Review Flagged Content (GET & DELETE)")

try:
    flagged = api_get("/moderator/flags")
    st.dataframe(flagged, use_container_width=True, hide_index=True)
except Exception:
    st.info("No flagged items found (or API not running).")

st.subheader("Delete Content (DELETE)")
post_id = st.number_input("PostID to delete", min_value=1, step=1)
if st.button("Delete Post"):
    try:
        api_delete(f"/posts/{int(post_id)}")
        st.success(f"Deleted post {int(post_id)}")
    except Exception as e:
        st.error(f"Error: {e}")
