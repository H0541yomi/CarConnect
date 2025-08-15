import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("RSVP Tracker (GET)")
event_id = st.number_input("EventID", min_value=1, step=1, value=1)
if st.button("Load RSVPs"):
    try:
        rows = api_get(f"/events/{int(event_id)}/rsvps")
        st.dataframe(rows, use_container_width=True, hide_index=True)
    except Exception as e:
        st.error(f"Error: {e}")
