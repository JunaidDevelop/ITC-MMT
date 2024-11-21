page 60001 "Student Enrollments_ITC"
{
    ApplicationArea = All;
    Caption = 'Student Enrollments-ITC';
    PageType = List;
    SourceTable = "Student Enrollment Table_ITC";
    UsageCategory = Administration;
    CardPageId = "Student Enrollment_ITC";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Batch; Rec.Batch)
                {
                    ApplicationArea = all;
                }
                field(Prefix; Rec.Prefix)
                {
                    ApplicationArea = all;
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = all;
                }
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = all;
                }
                field("State/province"; Rec."State/province")
                {
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = all;
                }
                field(MobNo1; Rec.MobNo1)
                {
                    ApplicationArea = all;
                }
                field(MobNo2; Rec.MobNo2)
                {
                    ApplicationArea = all;
                }

                field(CourseName; Rec.CourseName)
                {
                    ApplicationArea = all;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = all;
                }

                field(DOB; Rec.DOB)
                {
                    ApplicationArea = all;
                }
                field(EndDat; Rec.EndDat)
                {
                    ApplicationArea = all;
                }
                field("Father/GuardianMobumber"; Rec."Father/GuardianMobumber")
                {
                    ApplicationArea = all;
                }
                field("Father/GuardianName"; Rec."Father/GuardianName")
                {
                    ApplicationArea = all;
                }
                field("FatherCNIC/SmartCard"; Rec."FatherCNIC/SmartCard")
                {
                    ApplicationArea = all;
                }

                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
                field(InternshipIncl; Rec.InternshipIncl)
                {
                    ApplicationArea = all;
                }
                field(JoinDat; Rec.JoinDat)
                {
                    ApplicationArea = all;
                }


                field(PlanCreated; Rec.PlanCreated)
                {
                    ApplicationArea = all;
                }

                field(Refrence; Rec.Refrence)
                {
                    ApplicationArea = all;
                }
                field(RefrenceType; Rec.RefrenceType)
                {
                    ApplicationArea = all;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = all;
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = all;
                }

                field(StdScore; Rec.StdScore)
                {
                    ApplicationArea = all;
                }
                field(CertIssue; Rec.CertIssue)
                {
                    ApplicationArea = all;
                }
                field(StreetAddress; Rec.StreetAddress)
                {
                    ApplicationArea = all;
                }
                field("StudentB-form/CNIC/SmartCard"; Rec."StudentB-form/CNIC/SmartCard")
                {
                    ApplicationArea = all;
                }
                field(StudentEmail; Rec.StudentEmail)
                {
                    ApplicationArea = all;
                }

                field(TrainingEndDat; Rec.TrainingEndDat)
                {
                    ApplicationArea = all;
                }
                field(TrainingShift; Rec.TrainingShift)
                {
                    ApplicationArea = all;
                }
                field(TrainingStartDat; Rec.TrainingStartDat)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
