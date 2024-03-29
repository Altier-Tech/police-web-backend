from fastapi import APIRouter, Depends, Form

import mailer
from auth.authorize import get_current_user, credentials_exception, oauth2_scheme
from services.civilian_service import clearance_request, add_lost_item_report, add_complaint
from services.officer_service import get_officer_for_division

router = APIRouter(
    prefix="/api/civilian",
    tags=["civilian"],
    responses={404: {"description": "The requested uri was not found"}},
)


@router.post("/complaint")
async def new_complaint(
        name: str = Form(...),
        division: str = Form(...),
        district: str = Form(...),
        complaint: str = Form(...),
        token: str = Depends(oauth2_scheme)
):
    """
    The endpoint for reporting complaints
    Args:
        name: name of the civilian
        division: police division
        district: district
        complaint: the complaint
        token: access token

    Returns:

    """
    user = await get_current_user(token)

    if user is None:
        raise credentials_exception

    if user.role != "civilian":
        return {"message": "Only civilians can report complaints"}

    # Add the complaint to the database
    add_complaint(name, division, district, complaint)

    # Send a notification to the divisional officer
    divisional_officer = get_officer_for_division(division)
    if divisional_officer:
        mailer.send_mail(
            divisional_officer.email,
            "A civilian has reported a complaint"
        )

    return {"message": "Complaint is sent"}


@router.post("/lost-item-report")
async def lost_item_report(
        name: str = Form(...),
        division: str = Form(...),
        district: str = Form(...),
        item: str = Form(...),
        description: str = Form(...),
        token: str = Depends(oauth2_scheme)
):
    """
    The endpoint for reporting lost items
    Args:
        name: name of the civilian
        division: police division
        district: district
        item: the lost item
        description: description of the lost item
        token: access token

    Returns:

    """
    user = await get_current_user(token)

    if user is None:
        raise credentials_exception

    if user.role != "civilian":
        return {"message": "Only civilians can report lost items"}

    # Add the report to the database
    add_lost_item_report(name, division, district, item, description)

    # Send a notification to the divisional officer
    divisional_officer = get_officer_for_division(division)
    if divisional_officer:
        mailer.send_mail(
            divisional_officer.email,
            "A civilian has reported a lost item"
        )

    return {"message": "Lost item report is sent"}


@router.post("/request-clearance")
async def request_clearance(
        name: str = Form(...),
        division: str = Form(...),
        district: str = Form(...),
        description: str = Form(...),
        token: str = Depends(oauth2_scheme)
):
    """
    The endpoint for requesting clearance reports
    Args:
        name: name of the civilian
        division: police division
        district: district
        description: description of the request
        token: access token

    Returns:

    """
    user = await get_current_user(token)

    if user is None:
        raise credentials_exception

    if user.role != "civilian":
        return {"message": "Only civilians can request clearance"}

    # Add the request to the database
    clearance_request(name, division, district, description, user.email)

    # Send a notification to the divisional officer
    divisional_officer = get_officer_for_division(division)
    if divisional_officer:
        mailer.send_mail(
            divisional_officer.email,
            "A civilian has requested clearance"
        )

    return {"message": "Request for clearance is sent"}
