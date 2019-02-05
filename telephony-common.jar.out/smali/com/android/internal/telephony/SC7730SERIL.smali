.class public Lcom/android/internal/telephony/SC7730SERIL;
.super Lcom/android/internal/telephony/SamsungSPRDRIL;
.source "SC7730SERIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/SC7730SERIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/SamsungSPRDRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 50
    return-void
.end method


# virtual methods
.method public acceptCall(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 163
    const/16 v1, 0x28

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 165
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 166
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SC7730SERIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SC7730SERIL;->riljLog(Ljava/lang/String;)V

    .line 170
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SC7730SERIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 161
    return-void
.end method

.method public getHardwareConfig(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 58
    const-string/jumbo v1, "Ignoring call to \'getHardwareConfig\'"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SC7730SERIL;->riljLog(Ljava/lang/String;)V

    .line 59
    if-eqz p1, :cond_0

    .line 60
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 61
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 60
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 62
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p1, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 63
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 57
    .end local v0    # "ex":Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 15
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 85
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 86
    .local v6, "num":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 93
    .local v7, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v6, :cond_6

    .line 94
    new-instance v3, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v3}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .line 96
    .local v3, "dc":Lcom/android/internal/telephony/DriverCall;
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-static {v11}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 97
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    and-int/lit16 v11, v11, 0xff

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 98
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 99
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_0

    const/4 v11, 0x1

    :goto_1
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 100
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_1

    const/4 v11, 0x1

    :goto_2
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 101
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 102
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v10

    .line 103
    .local v10, "voiceSettings":I
    if-nez v10, :cond_2

    const/4 v11, 0x0

    :goto_3
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 105
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 106
    .local v1, "call_type":I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 107
    .local v0, "call_domain":I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "csv":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_3

    const/4 v11, 0x1

    :goto_4
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 109
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 110
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 111
    .local v5, "np":I
    invoke-static {v5}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 112
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 113
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-static {v11}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 114
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v9

    .line 115
    .local v9, "uusInfoPresent":I
    const/4 v11, 0x1

    if-ne v9, v11, :cond_4

    .line 116
    new-instance v11, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v11}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 117
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 118
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 119
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v8

    .line 120
    .local v8, "userData":[B
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v11, v8}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 121
    const-string/jumbo v11, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    .line 122
    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x0

    aput-object v13, v12, v14

    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x1

    aput-object v13, v12, v14

    .line 123
    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v13

    array-length v13, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x2

    aput-object v13, v12, v14

    .line 121
    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLogv(Ljava/lang/String;)V

    .line 124
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Incoming UUS : data (string)="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 125
    new-instance v12, Ljava/lang/String;

    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    .line 124
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLogv(Ljava/lang/String;)V

    .line 126
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Incoming UUS : data (hex): "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 127
    iget-object v12, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v12

    invoke-static {v12}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v12

    .line 126
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLogv(Ljava/lang/String;)V

    .line 133
    .end local v8    # "userData":[B
    :goto_5
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v12, v3, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v11, v12}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 135
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    iget-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v11, :cond_5

    .line 138
    iget-object v11, p0, Lcom/android/internal/telephony/SC7730SERIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v11}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 139
    const-string/jumbo v11, "InCall VoicePrivacy is enabled"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLog(Ljava/lang/String;)V

    .line 93
    :goto_6
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 99
    .end local v0    # "call_domain":I
    .end local v1    # "call_type":I
    .end local v2    # "csv":Ljava/lang/String;
    .end local v5    # "np":I
    .end local v9    # "uusInfoPresent":I
    .end local v10    # "voiceSettings":I
    :cond_0
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 100
    :cond_1
    const/4 v11, 0x0

    goto/16 :goto_2

    .line 103
    .restart local v10    # "voiceSettings":I
    :cond_2
    const/4 v11, 0x1

    goto/16 :goto_3

    .line 108
    .restart local v0    # "call_domain":I
    .restart local v1    # "call_type":I
    .restart local v2    # "csv":Ljava/lang/String;
    :cond_3
    const/4 v11, 0x0

    goto/16 :goto_4

    .line 129
    .restart local v5    # "np":I
    .restart local v9    # "uusInfoPresent":I
    :cond_4
    const-string/jumbo v11, "Incoming UUS : NOT present!"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLogv(Ljava/lang/String;)V

    goto :goto_5

    .line 141
    :cond_5
    iget-object v11, p0, Lcom/android/internal/telephony/SC7730SERIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v11}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 142
    const-string/jumbo v11, "InCall VoicePrivacy is disabled"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLog(Ljava/lang/String;)V

    goto :goto_6

    .line 146
    .end local v0    # "call_domain":I
    .end local v1    # "call_type":I
    .end local v2    # "csv":Ljava/lang/String;
    .end local v3    # "dc":Lcom/android/internal/telephony/DriverCall;
    .end local v5    # "np":I
    .end local v9    # "uusInfoPresent":I
    .end local v10    # "voiceSettings":I
    :cond_6
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 148
    if-nez v6, :cond_7

    iget-object v11, p0, Lcom/android/internal/telephony/SC7730SERIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 149
    iget-object v11, p0, Lcom/android/internal/telephony/SC7730SERIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v11, :cond_7

    .line 150
    const-string/jumbo v11, "responseCallList: call ended, testing emergency call, notify ECM Registrants"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SC7730SERIL;->riljLog(Ljava/lang/String;)V

    .line 152
    iget-object v11, p0, Lcom/android/internal/telephony/SC7730SERIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v11}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 156
    :cond_7
    return-object v7
.end method

.method public startLceService(IZLandroid/os/Message;)V
    .locals 3
    .param p1, "reportIntervalMs"    # I
    .param p2, "pullMode"    # Z
    .param p3, "response"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 69
    const-string/jumbo v0, "Link Capacity Estimate (LCE) service is not supported!"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SC7730SERIL;->riljLog(Ljava/lang/String;)V

    .line 70
    if-eqz p3, :cond_0

    .line 71
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 72
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 71
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    invoke-static {p3, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 73
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 68
    :cond_0
    return-void
.end method
