pageextension 60004 "BusinessManager EXT" extends "Business Manager Role Center"
{
    layout
    {
    }

    actions
    {
        addafter(Action41)
        {
            group("IT Work Center")
            {
                action("Students Enrollments-ITC")
                {
                    ApplicationArea = all;
                    RunObject = page "Student Enrollments_ITC";
                }
                action("Enrollment Setup-ITC")
                {
                    ApplicationArea = all;
                    RunObject = page "Enrollment Setup_JIT";
                }
            }
        }

    }

    var
        myInt: Integer;
}