AURA: Anomalous and Unexplained – Research and Analysis
Definition: A set of tools for the collection, organization and analysis of unexplained events, beings, people and locations.

Project Outline

In the various unique areas of paranormal research, there are common relationships to other areas of research. The goal of this software application, is to allow the investigator to determine those related commonalities to be visualized, interpreted and analyzed. Using neural networks to suggest common patterns in various unexplained phenomena, or Anomalies.

The problem we have today in the paranormal and unexplained realm, is that in my opinion, there is no collaboration between subject matter.

On one side, you have investigators researching only specific areas. For example, UFO’s and aliens, haunted places and objects, cryptids, myths and legends, the spiritual realms/occult sciences, conspiracies and secret societies, science (time-travel, anti-gravity, etc).

Requirements

    Basic Functionality
        Multi-users (sessions, record locking, collaborations, etc.)
        Support for Themes
        Display related data (climate, astronomical, related records, etc.)
        Location points on map (3D, Google, ??)
        Save custom reports
        Database replication (main server, backups, etc.)
        Detailed logging system
        Online chat system (text, video)
        Mobile reporting app
        Drag-drop elements
    Data collection an data entry
        Ability to record detailed information about reported mysterious and haunted locations, experiences of unexplained phenomena, observations and interactions with unknown beings or objects.
        Detailed breakdown of elements (type/sub-types, classifications/sub-classes, category, etc.)
        No duplicate Data (Multi-Point Data Verification System) – provide the user with the ability to reuse and/or import data returned from external sources to eliminate redundant data entry.
        Ability to import/export data (Internet, equipment, etc.)
        Data validation (spell checker, input validation, SQL injections, etc.)
        Quickly add elements (person, object, location, etc.)
    Investigations/Case Management
        The supervisor will assign case responsibility to a primary investigator. (Assignment factors may include the nature of the activity, type of follow-up required, the workload of available investigators, and cases already assigned.)
        Require peer review (other investigators) before public reporting.

System Tables

    Users, Groups, Permissions, Sessions

Common tables

    Classifications:
    Types:
    Roles: Subject, witness, investigator,
    Attributes: Height, weight, temperature, etc.

Lookup Tables

    Subjects:
    Category:
    Countries:
    States:
    Cities:
    Languages:
    Religions:
    Geology:
    Climate
    Astronomical:

Data tables (Main Data)

    Locations: Haunted or mysterious places,
    Location Points: GPS coordinates (can have multiple – Bermuda Triangle, etc.)
    Persons: Subject, investigator, witness or person with paranormal abilities, members of families, organizations, etc.)
    Phenomena: Orbs, Street light interference, levitation etc.)
    Abilities: Telepathy, invisibility, immortality, etc.)
    Manifestations:Apparitions, hallucinations, visions, phantoms, etc.
    Beings: Cryptids, aliens, creatures, spirits, fairies, etc.
    Objects: Phantom ships, cursed or haunted objects, everyday objects related to an incident, event, location, etc.
    Effects: Electromagnetic, Atmospheric, Perception, Physical.
    Organizations: Secret, government, historical, etc.
    Societies: Secret Orders, Societies and Fraternities.
    Families: Royal families, crime families, etc.
    Corporations: Can be associated with locations, events, phenomena, people and objects.

Cases/Investigation tables

    Investigations: Preliminary, field investigation, follow up.
    Investigators: Bio, image, contact information, current investigations, status, etc.
    Equipment: Types, check-out/in, assigned to, etc.
    Events: Events are single happenings in one location.
    Incidents: An incident can include more than one event spanning multiple locations with multiple persons, objects, phenomena, etc.
    Narratives: Witness testimony, investigator reporting, historical, outline, etc.
    Media: Documents, images, video, audio, data from field equipment, etc.
