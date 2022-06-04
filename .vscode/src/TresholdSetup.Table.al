table 50111 "Treshold Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Treshold Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';

        }
        field(2; "Treshold 1 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Treshold 1 Value';
        }
        field(3; "Treshold 2 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Treshold 2 Value';
        }
        field(4; "Treshold 1 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Treshold 1 Style';
        }
        field(5; "Treshold 2 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Treshold 2 Style';
        }
    }
}