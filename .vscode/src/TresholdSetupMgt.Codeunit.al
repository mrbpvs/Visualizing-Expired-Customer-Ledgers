codeunit 50112 TresholdSetupMgt
{
    procedure RuntresholdSetup(var TresholdSetupNotification: Notification)
    var
        TresholdSetup: Page "Treshold Setup";
    begin
        TresholdSetup.Run();
    end;
}