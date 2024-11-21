tableextension 60001 EmployeeExtension extends Employee
{
    fields
    {

        field(60007; "Sub Sections"; Option)
        {
            Caption = 'Sub Sections';
            DataClassification = ToBeClassified;
            OptionMembers = "Social Media Marketing","DM Marketing","App Development","Desktop Applications";
        }
        field(60008; Department; Option)
        {
            Caption = 'Department';
            DataClassification = ToBeClassified;
            OptionMembers = Learning,"R&D",Development,Marketing;
        }
        field(60009; EmployeeCNIC; Code[20])
        {
            Caption = 'EmployeCNIC';
            DataClassification = ToBeClassified;
        }
        field(60010; "Employeement Type"; Option)
        {
            Caption = 'Employeement Type';
            DataClassification = ToBeClassified;
            OptionMembers = "Hourly","Daily","Monthly";
        }
        field(60011; "Employee Salary"; Decimal)
        {
            Caption = 'Employee Salary';
            DataClassification = ToBeClassified;
        }
        field(60012; "Basic Salary"; Decimal)
        {
            Caption = 'Basic Salary';
            DataClassification = ToBeClassified;
        }
        field(60013; "House Rent"; Decimal)
        {
            Caption = 'House Rent';
            DataClassification = ToBeClassified;
        }
        field(60014; "Medical Allowance"; Decimal)
        {
            Caption = 'Medical Allowance';
            DataClassification = ToBeClassified;
        }
        field(60015; "S.A.A"; Decimal)
        {
            Caption = 'S.A.A';
            InitValue = 1200.00;
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(60016; CLA; Decimal)
        {
            Caption = 'CLA';
            DataClassification = ToBeClassified;
            InitValue = 250.00;
            Editable = false;
        }
        field(60017; "Gross Salary"; Decimal)
        {
            Caption = 'Gross Salary';
            DataClassification = ToBeClassified;
        }
        field(60018; "Phone Bill"; Decimal)
        {
            Caption = 'Mobile Bill';
            DataClassification = ToBeClassified;
        }
        field(60019; "Internet Sim"; Decimal)
        {
            Caption = 'Internet Sim';
            DataClassification = ToBeClassified;
        }
        field(60020; Tax; Decimal)
        {
            Caption = 'Tax';
            DataClassification = ToBeClassified;
        }
        field(60021; "PF Dedducation"; Decimal)
        {
            Caption = 'PF Deducation';
            DataClassification = ToBeClassified;
        }
        field(60022; "EOBI Paid by Employee"; Decimal)
        {
            Caption = 'EOBI Paid by Employee';
            DataClassification = ToBeClassified;
        }
        field(60023; "EOBI Paid by Employeer"; Decimal)
        {
            Caption = 'EOBI Paid by Employer';
            DataClassification = ToBeClassified;
        }
        field(60024; "Total Deduction"; Decimal)
        {
            Caption = 'Total Deduction';
            DataClassification = ToBeClassified;
        }
        field(60025; "Net Salary Payable"; Decimal)
        {
            Caption = 'Net Salary Payable';
            DataClassification = ToBeClassified;
        }
        field(60026; "Salary Payment Payable"; Decimal)
        {
            Caption = 'Salary Payment Payable';
            DataClassification = ToBeClassified;
        }
        field(60027; "BANK Transfer"; Boolean)
        {
            Caption = 'BANK Transfer';
            DataClassification = ToBeClassified;
            // InitValue = false;
        }
        field(60028; Cash; Boolean)
        {
            Caption = 'Cash';
            DataClassification = ToBeClassified;
            InitValue = true;
        }

        field(60029; "Father Name"; Code[20])
        {
            Caption = 'Father Name';
            DataClassification = ToBeClassified;
        }
        field(60030; EmplSection; Option)
        {
            Caption = 'Section';
            OptionMembers = Accounting,"Finanace",Development,Marketing;
            DataClassification = ToBeClassified;
        }
        field(60031; Allowances; Decimal)
        {
            Caption = 'Allowances';
            DataClassification = ToBeClassified;
        }
        field(60032; "WorkingDays"; Integer)
        {
            Caption = 'Working Days';
            DataClassification = ToBeClassified;

        }

    }
}
