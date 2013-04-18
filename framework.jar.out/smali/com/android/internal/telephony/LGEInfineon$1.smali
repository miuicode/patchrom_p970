.class Lcom/android/internal/telephony/LGEInfineon$1;
.super Landroid/telephony/PhoneStateListener;
.source "LGEInfineon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/telephony/LGEInfineon;-><init>(Landroid/content/Context;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/LGEInfineon;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/LGEInfineon;)V
    .locals 0
    .parameter

    .prologue
    .line 33
    iput-object p1, p0, Lcom/android/internal/telephony/LGEInfineon$1;->this$0:Lcom/android/internal/telephony/LGEInfineon;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 1
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 37
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/LGEInfineon$1;->this$0:Lcom/android/internal/telephony/LGEInfineon;

    iget v0, v0, Lcom/android/internal/telephony/LGEInfineon;->mCallState:I

    if-le p1, v0, :cond_1

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/LGEInfineon$1;->this$0:Lcom/android/internal/telephony/LGEInfineon;

    iput p1, v0, Lcom/android/internal/telephony/LGEInfineon;->mCallState:I

    .line 39
    :cond_1
    return-void
.end method
