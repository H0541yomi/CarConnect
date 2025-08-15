import streamlit as st
from modules.nav import SideBarLinks


st.set_page_config(layout="wide")
SideBarLinks()

st.header("Create Event (POST)")
with st.form("create_event"):
    host_id = st.number_input("HostID (UserID)", min_value=1, step=1)
    name = st.text_input("Name", placeholder="First Event Ever!")
    description = st.text_area("Description")
    submitted = st.form_submit_button("Create Event")
    if submitted:
        try:
            payload = {"host_id": int(host_id), "name": name, "description": description}
            data = api_post("/events", json=payload)
            st.success(f"Created: {data}")
        except Exception as e:
            st.error(f"Error: {e}")
