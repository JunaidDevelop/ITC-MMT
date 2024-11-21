tableextension 60002 "UserSetup EXT" extends "User Setup"
{
    fields
    {
        field(60001; "Student Handle_ITC"; Boolean)
        {
            Caption = 'Student Handle';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}