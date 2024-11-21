page 60003 "Enrollment Setup_JIT"
{
    Caption = 'Enrollment Setup-ITC';
    PageType = Card;
    ApplicationArea = All;
    DeleteAllowed = false;
    UsageCategory = Administration;
    SourceTable = "Enrollmeent Setup_ITC";

    layout
    {
        area(Content)
        {
            group("No. Series")
            {
                field("NO.Series"; Rec."NO.Series")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}
