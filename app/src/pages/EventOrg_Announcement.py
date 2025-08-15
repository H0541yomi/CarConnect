import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Send Announcement (POST)")
with st.form("announce"):
    event_id = st.number_input("EventID", min_value=1, step=1)
    author_id = st.number_input("AuthorID", min_value=1, step=1)
    body = st.text_area("Message")
    submitted = st.form_submit_button("Send")
    if submitted:
        try:
            payload = {"author_id": int(author_id), "body": body}
            data = api_post(f"/events/{int(event_id)}/announce", json=payload)
            st.success(f"Sent: {data}")
        except Exception as e:
            st.error(f"Error: {e}")

st.divider()
st.header("Duplicate & Manage Event (POST/PUT/DELETE)")
src_event_id = st.number_input("Source EventID", min_value=1, step=1, value=1, key="src")
if st.button("Duplicate Event (POST)"):
    try:
        data = api_post(f"/events/{int(src_event_id)}/duplicate")
        st.success(f"Duplicated: {data}")
    except Exception as e:
        st.error(f"Error: {e}")

st.subheader("Rename Event (PUT)")
event_id = st.number_input("EventID to Rename", min_value=1, step=1, value=1, key="rename")
new_name = st.text_input("New Name", value="Repeat Event")
if st.button("Rename"):
    try:
        data = api_put(f"/events/{int(event_id)}", json={"name": new_name})
        st.success(f"Renamed: {data}")
    except Exception as e:
        st.error(f"Error: {e}")

st.subheader("Cancel Event (DELETE)")
event_id_del = st.number_input("EventID to Delete", min_value=1, step=1, key="delete")
if st.button("Delete Event"):
    try:
        api_delete(f"/events/{int(event_id_del)}")
        st.success(f"Deleted event {int(event_id_del)}")
    except Exception as e:
        st.error(f"Error: {e}")

