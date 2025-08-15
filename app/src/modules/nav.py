import streamlit as st

def _links_moderator():
    st.sidebar.page_link("./pages/Moderator_Home.py", label="Home", icon="🛡️")
    st.sidebar.page_link("./pages/Moderator_Bot_Manager.py", label="Bot Manager", icon="🤖")
    st.sidebar.page_link("./pages/Moderator_Flag_Review.py", label="Flag Review", icon="🚩")
    st.sidebar.page_link("./pages/Moderator_Verify_Users.py", label="Verify Users", icon="✅")

def _links_user():
    st.sidebar.page_link("./pages/User_Home.py", label="Home", icon="👤")
    st.sidebar.page_link("./pages/User_Create_Post.py", label="Create Post", icon="✍️")
    st.sidebar.page_link("./pages/User_Find_And_Follow.py", label="Find & Follow", icon="🔎")
    st.sidebar.page_link("./pages/User_Compare_Builds.py", label="Compare Builds", icon="⚙️")

def _links_advertiser():
    st.sidebar.page_link("./pages/Advertiser_Home.py", label="Home", icon="📣")
    st.sidebar.page_link("./pages/Advertiser_Create_Ad.py", label="Create Ad", icon="🧲")
    st.sidebar.page_link("./pages/Advertiser_Campaign_Analytics.py", label="Campaign Analytics", icon="📊")
    st.sidebar.page_link("./pages/Advertiser_Audience_Demographics.py", label="Audience & Tags", icon="👥")

def _links_event_org():
    st.sidebar.page_link("./pages/EventOrg_Home.py", label="Home", icon="📅")
    st.sidebar.page_link("./pages/EventOrg_Create_Event.py", label="Create Event", icon="🆕")
    st.sidebar.page_link("./pages/EventOrg_RSVP_Tracker.py", label="RSVP Tracker", icon="📋")
    st.sidebar.page_link("./pages/EventOrg_Announcement.py", label="Announcements & Duplicate", icon="📣")

def SideBarLinks():
    role = st.session_state.get("role")
    if not role:
        return
    st.sidebar.image("assets/logo.png", use_container_width=True)
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
        return        
