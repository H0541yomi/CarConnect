
import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout="wide")
SideBarLinks()

st.title("Moderator — Home")
st.write("Quick links to moderation tools are in the sidebar.")
