import streamlit as st
from modules.nav import SideBarLinks
from utils.api import api_get, api_post, api_put, api_delete

st.set_page_config(layout="wide")
SideBarLinks()

st.header("Audience Demographics (GET) & Tag Interests (PUT)")
try:
    demo = api_get("/post_analytics/demographics", params={"PostId": int(post_id)})
    st.dataframe(demo, use_container_width=True, hide_index=True)
except Exception:
    st.info("No demographic data yet (or API not running).")

st.subheader("Tag an Ad with Interest (PUT)")
ad_id = st.number_input("Ad (Post) ID", min_value=1, step=1)
tag = st.text_input("Tag/Hashtag", placeholder="JDM, turbo, stance, ...")
if st.button("Apply Tag"):
    try:
        data = api_put(f"/ads/{int(ad_id)}/tags", json={"tag": tag})
        st.success(f"Tagged: {data}")
    except Exception as e:
        st.error(f"Error: {e}")
