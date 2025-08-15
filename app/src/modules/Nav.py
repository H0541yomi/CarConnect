import streamlit as st

def _links_moderator():
    st.sidebar.page_link("src/pages/00_Moderator_Home.py", label="Home", icon="🛡️")
    st.sidebar.page_link("src/pages/01_Moderator_Bot_Manager.py", label="Bot Manager", icon="🤖")
    st.sidebar.page_link("src/pages/02_Moderator_Flag_Review.py", label="Flag Review", icon="🚩")
    st.sidebar.page_link("src/pages/03_Moderator_Verify_Users.py", label="Verify Users", icon="✅")

def _links_user():
    st.sidebar.page_link("src/pages/10_User_Home.py", label="Home", icon="👤")
    st.sidebar.page_link("src/pages/11_User_Create_Post.py", label="Create Post", icon="✍️")
    st.sidebar.page_link("src/pages/12_User_Find_And_Follow.py", label="Find & Follow", icon="🔎")
    st.sidebar.page_link("src/pages/13_User_Compare_Builds.py", label="Compare Builds", icon="⚙️")

def _links_advertiser():
    st.sidebar.page_link("src/pages/20_Advertiser_Home.py", label="Home", icon="📣")
    st.sidebar.page_link("src/pages/21_Advertiser_Create_Ad.py", label="Create Ad", icon="🧲")
    st.sidebar.page_link("src/pages/22_Advertiser_Campaign_Analytics.py", label="Campaign Analytics", icon="📊")
    st.sidebar.page_link("src/pages/23_Advertiser_Audience_Demographics.py", label="Audience & Tags", icon="👥")

def _links_event_org():
    st.sidebar.page_link("src/pages/30_EventOrg_Home.py", label="Home", icon="📅")
    st.sidebar.page_link("src/pages/31_EventOrg_Create_Event.py", label="Create Event", icon="🆕")
    st.sidebar.page_link("src/pages/32_EventOrg_RSVP_Tracker.py", label="RSVP Tracker", icon="📋")
    st.sidebar.page_link("src/pages/33_EventOrg_Announcements_and_Duplicate.py", label="Announcements & Duplicate", icon="📣")

def SideBarLinks():
    role = st.session_state.get("role")
    if not role:
        return
    st.sidebar.image("assets/logo.png", use_column_width=True)
    st.sidebar.markdown(f"**Role:** {role}")
    st.sidebar.divider()
    if role == "Moderator":
        _links_moderator()
    elif role == "User":
        _links_user()
    elif role == "Advertiser":
        _links_advertiser()
    elif role == "Event Organizer":
        _links_event_org()
    else:
        st.sidebar.info("Unknown role")
