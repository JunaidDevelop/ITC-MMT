pageextension 60005 "UserSetup EXT" extends "User Setup"
{
    layout
    {
        addbefore("Salespers./Purch. Code")
        {
            field("Student Handle_ITC"; Rec."Student Handle_ITC")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}