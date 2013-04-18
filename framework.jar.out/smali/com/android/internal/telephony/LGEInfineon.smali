.class public Lcom/android/internal/telephony/LGEInfineon;
.super Lcom/android/internal/telephony/RIL;
.source "LGEInfineon.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# static fields
.field static final RIL_REQUEST_HANG_UP_CALL:I = 0xb6

.field static final RIL_UNSOL_LGE_SIM_STATE_CHANGED:I = 0x424


# instance fields
.field protected mCallState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 3
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    .line 48
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/telephony/LGEInfineon;->mCallState:I

    .line 33
    new-instance v0, Lcom/android/internal/telephony/LGEInfineon$1;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/LGEInfineon$1;-><init>(Lcom/android/internal/telephony/LGEInfineon;)V

    .line 43
    .local v0, mPhoneStateListener:Landroid/telephony/PhoneStateListener;
    const-string/jumbo v1, "phone"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    const/16 v2, 0x20

    invoke-virtual {v1, v0, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 46
    return-void
.end method

.method private static hexStringToByteArray(Ljava/lang/String;)[B
    .locals 7
    .parameter "s"

    .prologue
    const/16 v6, 0x10

    .line 66
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 67
    .local v2, len:I
    div-int/lit8 v3, v2, 0x2

    new-array v0, v3, [B

    .line 68
    .local v0, data:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 69
    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 68
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 72
    :cond_0
    return-object v0
.end method


# virtual methods
.method public hangupWaitingOrBackground(Landroid/os/Message;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 55
    iget v1, p0, Lcom/android/internal/telephony/LGEInfineon;->mCallState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/16 v1, 0xd

    :goto_0
    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 60
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/LGEInfineon;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/LGEInfineon;->riljLog(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/LGEInfineon;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 63
    return-void

    .line 55
    .end local v0           #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_0
    const/16 v1, 0xb6

    goto :goto_0
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 10
    .parameter "p"

    .prologue
    const/4 v6, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x1

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 82
    .local v0, dataPosition:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 84
    .local v2, response:I
    sparse-switch v2, :sswitch_data_0

    .line 89
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 92
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 85
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LGEInfineon;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .line 95
    .local v3, ret:Ljava/lang/Object;
    :goto_1
    sparse-switch v2, :sswitch_data_1

    goto :goto_0

    :sswitch_1
    move-object v4, v3

    .line 97
    check-cast v4, [Ljava/lang/String;

    move-object v1, v4

    check-cast v1, [Ljava/lang/String;

    .line 99
    .local v1, resp:[Ljava/lang/String;
    array-length v4, v1

    if-ge v4, v6, :cond_1

    .line 100
    new-array v1, v6, [Ljava/lang/String;

    .line 101
    check-cast v3, [Ljava/lang/String;

    .end local v3           #ret:Ljava/lang/Object;
    check-cast v3, [Ljava/lang/String;

    aget-object v4, v3, v8

    aput-object v4, v1, v8

    .line 102
    aput-object v9, v1, v5

    .line 104
    :cond_1
    aget-object v4, v1, v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    rem-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_2

    aget-object v4, v1, v5

    const-string v5, "[0-9A-F]+"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 106
    const/4 v4, 0x1

    :try_start_0
    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x1

    aget-object v6, v1, v6

    invoke-static {v6}, Lcom/android/internal/telephony/LGEInfineon;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v6

    const-string v7, "UTF-16"

    invoke-direct {v5, v6, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    aput-object v5, v1, v4
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :cond_2
    :goto_2
    aget-object v4, v1, v8

    invoke-virtual {p0, v2, v4}, Lcom/android/internal/telephony/LGEInfineon;->unsljLogMore(ILjava/lang/String;)V

    .line 114
    iget-object v4, p0, Lcom/android/internal/telephony/LGEInfineon;->mUSSDRegistrant:Landroid/os/Registrant;

    if-eqz v4, :cond_0

    .line 115
    iget-object v4, p0, Lcom/android/internal/telephony/LGEInfineon;->mUSSDRegistrant:Landroid/os/Registrant;

    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v9, v1, v9}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v4, v5}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 86
    .end local v1           #resp:[Ljava/lang/String;
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LGEInfineon;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 120
    :sswitch_3
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/LGEInfineon;->unsljLog(I)V

    .line 122
    iget-object v4, p0, Lcom/android/internal/telephony/LGEInfineon;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v4, :cond_0

    .line 123
    iget-object v4, p0, Lcom/android/internal/telephony/LGEInfineon;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v4}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto :goto_0

    .line 109
    .end local v3           #ret:Ljava/lang/Object;
    .restart local v1       #resp:[Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_2

    .line 107
    :catch_1
    move-exception v4

    goto :goto_2

    .line 84
    :sswitch_data_0
    .sparse-switch
        0x3ee -> :sswitch_0
        0x424 -> :sswitch_2
    .end sparse-switch

    .line 95
    :sswitch_data_1
    .sparse-switch
        0x3ee -> :sswitch_1
        0x424 -> :sswitch_3
    .end sparse-switch
.end method
