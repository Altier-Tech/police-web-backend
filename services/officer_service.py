from services.database_service import dao


def get_alerts():
    try:
        data = dao.query_alerts()[0]
        dao.set_alert_off(data[1])
        return data
    except Exception:
        return {"message": "no recent criminal sightings"}


def update_criminal_data(c_id, name, age, description, division, district):
    try:
        data = dao.update_criminal(c_id, name, age, description, division, district)
        return data
    except Exception:
        return {"error": "db error update criminal"}


def get_all_clearance_requests():
    return dao.query_all_clearance_requests()


def all_complaints():
    return dao.query_all_complaints()


def get_all_lost_item_reports():
    return dao.query_all_lost_item_reports()


def get_single_clearance_request(r_id):
    return dao.query_single_clearance_request(r_id)


def update_clearance_report(r_id, o_id, details, status):
    if status == "approved":
        return dao.update_approve_clearance_report(r_id, o_id, details)
    else:
        return dao.update_disapprove_clearance_report(r_id, o_id, details)


def get_criminal_sightings(name):
    return dao.query_criminal_sightings(name)


def get_officer_id(u_id):
    return dao.query_officer_id(u_id)


def add_new_criminal(name, age, description, division, district):
    return dao.insert_new_criminal(name, age, description, division, district)


def get_officer_for_division(division):
    return dao.query_officer_for_division(division)


def get_all_criminals():
    return dao.query_all_criminals()
