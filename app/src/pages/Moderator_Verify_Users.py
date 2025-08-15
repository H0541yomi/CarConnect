import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Verify Account (PUT)")
user_id = st.number_input("UserID", min_value=1, step=1)
verified = st.selectbox("Verification Status", ["unverified", "verified"])
if st.button("Update Verification"):
    try:
        data = api_put(f"/users/{int(user_id)}/verification", json={"status": verified})
        st.success(f"Updated: {data}")
    except Exception as e:
        st.error(f"Error: {e}")
