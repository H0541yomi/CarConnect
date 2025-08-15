import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Compare Car Builds (GET)")
ids = st.text_input("Car IDs (comma-separated)", value="1,2")
if st.button("Compare"):
    try:
        car_ids = [int(x.strip()) for x in ids.split(",") if x.strip()]
        builds = api_get("/cars/builds", params={"ids": ",".join(map(str, car_ids))})
        st.dataframe(builds, use_container_width=True, hide_index=True)
    except Exception as e:
        st.error(f"Error: {e}")
