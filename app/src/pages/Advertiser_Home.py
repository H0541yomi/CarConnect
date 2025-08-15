import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Advertiser — Home")
st.write("Manage ads, view campaign analytics, and target audiences.")
