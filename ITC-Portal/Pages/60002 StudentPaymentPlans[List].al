page 60002 "Student Payment Plans_ITC"
{
    Caption = 'Student Payment Plans';
    PageType = List;
    SourceTable = "Student Payment Plans_ITC";
    layout
    {
        area(Content)
        {
            repeater("Student Payment Plan")
            {

                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = All;
                }
                field(Installment; Rec.Installment)
                {
                    Caption = 'Installment';
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.Notification := Rec."Due Date";
                        Rec.Notification := CalcDate('-5D', Rec.Notification);
                    end;
                }
                field(Notification; Rec.Notification)
                {
                    ApplicationArea = All;
                }
                field("Base Amount"; Rec."Base Amount")
                {
                    ApplicationArea = all;
                }
                field("Disc."; Rec."Percentage")
                {
                    Caption = 'Disc.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Invoiced; Rec.Invoiced)
                {
                    ApplicationArea = All;
                }
                field(Order; Rec.Order)
                {
                    ApplicationArea = all;
                }
                field("Pmt. Record"; Rec."Pmt. Record")
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
            action("Make Order")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    StdPaymentPlain_lrec: Record "Student Payment Plans_ITC";
                begin
                    if Dialog.Confirm('Do you want to Make Sales Order against student ID %1', true, Rec."Student ID") then begin
                        StdPaymentPlain_lrec.Reset();
                        CurrPage.SetSelectionFilter(StdPaymentPlain_lrec);
                        if StdPaymentPlain_lrec.FindSet() then begin
                            repeat
                                if (StdPaymentPlain_lrec.Order = false) and (StdPaymentPlain_lrec.Invoiced = false) then
                                    CreateSalesOrder(StdPaymentPlain_lrec);
                            until StdPaymentPlain_lrec.Next() = 0;
                            Message('Sales Order is created against student ID No %1', Rec."Student ID");
                        end
                        else
                            Message('Sales Order is already Created against this line');
                    end;
                end;
            }
        }
    }
    procedure CreateSalesOrder(StdPaymentPlain_lrec: Record "Student Payment Plans_ITC")
    var
        Saleshdr_lrec: Record "Sales Header";
        Cust_lrec: Record Customer;
        SalesandRece: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        Cust_lrec.Reset();
        Cust_lrec.Get(Rec."Student ID");
        SalesandRece.Reset();
        SalesandRece.Get();
        SalesandRece.TestField("Order Nos.");
        Saleshdr_lrec.Reset();
        Saleshdr_lrec.SetRange("Student Source ID_ITC", Rec."Student ID");
        Saleshdr_lrec.SetRange("Document Type", Saleshdr_lrec."Document Type"::Order);
        if not Saleshdr_lrec.FindFirst() then begin
            Saleshdr_lrec.Init();
            Saleshdr_lrec."No." := NoSeries.GetNextNo(SalesandRece."Order Nos.", Today, true);
            Saleshdr_lrec."Document Type" := Saleshdr_lrec."Document Type"::Order;
            Saleshdr_lrec.Validate("Sell-to Customer No.", Cust_lrec."No.");
            Saleshdr_lrec."Student Source ID_ITC" := StdPaymentPlain_lrec."Student ID";
            Saleshdr_lrec.Insert();
            CreateSalesLine(Saleshdr_lrec, StdPaymentPlain_lrec);
        end
        else
            CreateSalesLine(Saleshdr_lrec, StdPaymentPlain_lrec);
    end;

    procedure CreateSalesLine(Saleshdr: Record "Sales Header"; Stdpaymentplains: Record "Student Payment Plans_ITC")
    var
        salesLine_lrec: Record "Sales Line";
        Nextno: Integer;
    begin
        salesLine_lrec.Reset();
        salesLine_lrec.SetCurrentKey("Line No.");
        salesLine_lrec.SetAscending("Line No.", true);
        salesLine_lrec.SetRange("Document No.", Saleshdr."No.");
        salesLine_lrec.SetRange("Document Type", Saleshdr."Document Type");
        if salesLine_lrec.FindLast() then begin
            Nextno := salesLine_lrec."Line No." + 10000
        end
        else
            Nextno := 10000;
        salesLine_lrec.Init();
        salesLine_lrec."Line No." := Nextno;
        salesLine_lrec."Document No." := Saleshdr."No.";
        salesLine_lrec."Document Type" := Saleshdr."Document Type";
        salesLine_lrec.Type := salesLine_lrec.Type::Item;
        salesLine_lrec.Validate("No.", Stdpaymentplains.Course);
        salesLine_lrec."Sell-to Customer No." := Saleshdr."Sell-to Customer No.";
        salesLine_lrec.Validate(Quantity, 1);
        salesLine_lrec.Validate("Unit Price", Stdpaymentplains."Base Amount");
        salesLine_lrec.Validate("Line Discount %", Stdpaymentplains.Percentage);
        salesLine_lrec.Installment_ITC := Stdpaymentplains.Installment;
        salesLine_lrec.Insert();
        Stdpaymentplains.Order := true;
        Stdpaymentplains.Modify();
    end;

    var
        myInt: Integer;
        EnrollmentplanCourses: Record "Student Enrollment Table_ITC";
}