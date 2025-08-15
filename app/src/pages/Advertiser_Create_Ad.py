import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Create Ad Post (POST)")
with st.form("create_ad"):
    advertiser_id = st.number_input("AdvertiserID", min_value=1, step=1)
    title = st.text_input("Title", placeholder="Get our new product")
    body = st.text_area("Body", placeholder="It will change your life")
    submitted = st.form_submit_button("Create Ad")
    if submitted:
        try:
            payload = {"advertiser_id": int(advertiser_id), "title": title, "body": body}
            data = api_post("/ads", json=payload)
            st.success(f"Created Ad: {data}")
        except Exception as e:
            st.error(f"Error: {e}")

