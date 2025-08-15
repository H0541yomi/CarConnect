import streamlit as st
from modules.nav import SideBarLinks


st.set_page_config(layout="wide")
SideBarLinks()

st.header("Campaign Analytics (GET)")
try:
    rows = api_get("/ads/campaigns/analytics")
    st.dataframe(rows, use_container_width=True, hide_index=True)
except Exception as e:
    st.info("No analytics yet (or API not running).")
