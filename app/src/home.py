import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(page_title="RevNet", page_icon="🚗", layout="wide")
SideBarLinks()

st.title("RevNet — Persona Selector (Mock Login)")
st.caption("No real authentication. Choose a persona to continue.")

col1, col2, col3, col4 = st.columns(4)
personas = [
    ("Moderator", "00_Moderator_Home"),
    ("User", "10_User_Home"),
    ("Advertiser", "20_Advertiser_Home"),
    ("Event Organizer", "30_EventOrg_Home"),
]

for (label, page), col in zip(personas, [col1, col2, col3, col4]):
    with col:
        if st.button(label, use_container_width=True):
            st.session_state["role"] = label
            st.session_state["first_name"] = label.split()[0]
            st.session_state["authenticated"] = True
            st.switch_page(f"src/pages/{page}.py")

st.divider()
st.image("assets/logo.png", width=220)
st.write("This app mirrors the CS3200 template structure: role-based links in the sidebar (via modules/nav.py) and numbered pages in src/pages/.")
