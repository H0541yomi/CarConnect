import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Create Moderation Bot (POST)")
with st.form("create_bot"):
    name = st.text_input("Bot Name", placeholder="RevBot")
    dev_id = st.number_input("Developer (UserID)", min_value=1, step=1)
    submitted = st.form_submit_button("Create Bot")
    if submitted:
        try:
            payload = {"name": name, "dev_id": int(dev_id)}
            data = api_post("/moderator/bots", json=payload)
            st.success(f"Created bot: {data}")
        except Exception as e:
            st.error(f"Error: {e}")

st.divider()
st.subheader("Existing Bots (GET)")
try:
    bots = api_get("/moderator/bots")
    st.dataframe(bots, use_container_width=True, hide_index=True)
except Exception:
    st.info("No bots loaded yet (or API not running).")

