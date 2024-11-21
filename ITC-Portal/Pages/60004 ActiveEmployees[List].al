page 60004 "Active Employees_ITC"
{
    Caption = 'Active Employees';
    PageType = List;
    SourceTable = Employee;


    layout
    {
        area(Content)
        {
            repeater(Active)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Employee Code';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(FullName; Rec.FullName())
                {
                    Caption = 'Full Name';
                    ToolTip = 'Specifies the full name of the employee.';
                    Visible = false;
                }



                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the employee''s Department.';

                }
                field("Sub Sections"; Rec."Sub Sections")
                {
                    ToolTip = 'Specifies the employee''s Sub Sections.';

                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field(CNIC; Rec."EmployeeCNIC")
                {
                    Caption = 'Employee CNIC';
                    ToolTip = 'Specifies the EmployeeCNIC.';
                }
                field("Employeement Type"; Rec."Employeement Type")
                {

                }
                field(WorkingDays; Rec.WorkingDays)
                {
                    Caption = 'Working Days';
                    trigger OnValidate()
                    var
                    begin
                        if Rec.WorkingDays <= 30 then begin
                            if Rec."Employee Salary" > 0 then begin
                                Rec."Employee Salary" := (Rec."Employee Salary" / 30) * Rec.WorkingDays;
                                Rec."Basic Salary" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 50);
                                Rec."PF Dedducation" := Rec."Basic Salary" / 100 * 10;
                                Rec."House Rent" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 30);
                                Rec."Medical Allowance" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 20);
                                Rec."Gross Salary" := ((((Rec."Basic Salary" + Rec."House Rent") + Rec."Medical Allowance") + Rec."S.A.A") + Rec.CLA);
                                Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                                Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");

                                Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                            end
                            else begin
                                Error('Employee Salary is Zero');

                                Rec."Basic Salary" := 0;
                                Rec."PF Dedducation" := 0;
                                Rec."House Rent" := 0;
                                Rec."Medical Allowance" := 0;
                                Rec."Gross Salary" := 0;
                                Rec."Net Salary Payable" := 0;
                                Rec."PF Dedducation" := 0;
                                Rec.Allowances := Rec."Phone Bill" + Rec."Internet Sim";
                                Rec."Net Salary Payable" := Rec."Gross Salary" + Rec."Internet Sim" + Rec."Phone Bill" - Rec."Total Deduction";
                            end;
                        end
                        else begin
                            Error('Enter a Valid working Days not more then 30');
                        end;
                    end;

                }
                field("Employee Salary"; Rec."Employee Salary")
                {
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        EmployeeRec: Record "Employee";
                    begin
                        if Rec."Employee Salary" > 0 then begin
                            Rec.Reset();
                            Rec."Basic Salary" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 50);
                            Rec."PF Dedducation" := Rec."Basic Salary" / 100 * 10;
                            Rec."House Rent" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 30);
                            Rec."Medical Allowance" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 20);
                            Rec."Gross Salary" := ((((Rec."Basic Salary" + Rec."House Rent") + Rec."Medical Allowance") + Rec."S.A.A") + Rec.CLA);
                            Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                            Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");

                            Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                        end
                        else begin
                            Rec."Basic Salary" := 0;
                            Rec."PF Dedducation" := 0;
                            Rec."House Rent" := 0;
                            Rec."Medical Allowance" := 0;
                            Rec."Gross Salary" := 0;
                            Rec."Net Salary Payable" := 0;
                            Rec."PF Dedducation" := 0;
                            Rec.Allowances := Rec."Phone Bill" + Rec."Internet Sim";
                            Rec."Net Salary Payable" := Rec."Gross Salary" + Rec."Internet Sim" + Rec."Phone Bill" - Rec."Total Deduction";
                        end;
                    end;


                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    Editable = false;
                }
                field("House Rent"; Rec."House Rent")
                {
                    Editable = false;
                }
                field("Medical Allowance"; Rec."Medical Allowance")
                {
                    Editable = false;
                }
                field("S.A.A"; Rec."S.A.A")
                {

                }
                field(CLA; Rec.CLA)
                {

                }
                field("Gross Salary"; Rec."Gross Salary")
                {
                    Editable = false;
                }
                field(Allowances; Rec.Allowances)
                {

                }
                field("Phone Bill"; Rec."Phone Bill")
                {
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                        Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");
                    end;
                }
                field("Internet Sim"; Rec."Internet Sim")
                {
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                        Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");
                    end;
                }
                field("Total Deduction"; Rec."Total Deduction")
                {
                    Editable = false;
                }
                field(Tax; Rec.Tax)
                {
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                    end;
                }
                field("PF Dedducation"; Rec."PF Dedducation")
                {
                    Editable = false;
                    trigger OnValidate()
                    var
                    begin
                        Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");
                    end;
                }
                field("EOBI Paid by Employee"; Rec."EOBI Paid by Employee")
                {
                    trigger OnValidate()
                    var
                    begin
                        Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                    end;
                }
                field("EOBI Paid by Employeer"; Rec."EOBI Paid by Employeer")
                {

                }
                field("Net Salary Payable"; Rec."Net Salary Payable")
                {
                    Editable = false;
                }
                field("Salary Payment Payable"; Rec."Salary Payment Payable")
                {

                }
                field("BANK Transfer"; Rec."BANK Transfer")
                {

                }
                field(IBAN; Rec.IBAN)
                {

                }
                field(Cash; Rec.Cash)
                {

                }


            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Process)
            {
                ApplicationArea = All;
                Image = Process;
                trigger OnAction()
                var
                    General: Record "Gen. Journal Line";
                    NextLineNo: Integer;
                    DocNo: Integer;
                    Page_Genejournal: Page "General Journal";
                begin
                    General.Reset();
                    if Dialog.Confirm('Do you want to Create General Journal Line?', true) then begin
                        CurrPage.SetSelectionFilter(Rec);
                        if Rec.FindSet() then begin
                            repeat
                                General.SetCurrentKey("Line No.");
                                General.SetAscending("Line No.", true);
                                General.SetRange("Journal Template Name", 'GENERAL');
                                General.SetRange("Journal Batch Name", 'DEFAULT');
                                if General.FindLast() then begin
                                    NextLineNo := General."Line No." + 10000;
                                end
                                else
                                    NextLineNo := 10000;
                                General.Init();
                                General."Line No." := NextLineNo;
                                General."Document Type" := General."Document Type"::Payment;
                                General."Document No." := General."Document No." + '1';
                                General."Journal Batch Name" := 'DEFAULT';
                                General."Journal Template Name" := 'GENERAL';
                                General."Account Type" := General."Account Type"::Employee;
                                General.Validate("Account No.", Rec."No.");
                                General.Validate(Amount, Rec."Gross Salary");
                                General."Bal. Account Type" := General."Bal. Account Type"::"G/L Account";
                                General.Validate("Bal. Account No.", '8720');
                                General.Insert();
                            until Rec.Next() = 0;
                            Message('General Journal Line Created Successfully');
                            if Dialog.Confirm('Do you Want to Open General Journal?', true) then
                                Page_Genejournal.Run();
                        end;
                    end;
                end;

            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Process_Promoted; Process)
                {
                }
            }
        }
    }
    var
}