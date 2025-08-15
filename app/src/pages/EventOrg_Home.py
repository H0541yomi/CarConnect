import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Event Organizer — Home")
st.write("Create events, track RSVPs, and communicate with attendees.")
