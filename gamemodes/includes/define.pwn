#define SendSyntaxMessage(%0,%1) \
	SendClientMessageEx(%0, COLOR_LIGHTRED, "�����:"EMBED_WHITE" "%1)

// ������ BitFlag
#define BitFlag_Get(%0,%1)   		((%0) & (%1))   // �觤�ҡ�Ѻ 0 (��)�ҡ�ѧ������駤������ѹ
#define BitFlag_On(%0,%1)    		((%0) |= (%1))  // ��Ѻ����� �Դ
#define BitFlag_Off(%0,%1)   		((%0) &= ~(%1)) // ��Ѻ����� �Դ
#define BitFlag_Toggle(%0,%1)		((%0) ^= (%1))  // ��Ѻ��� (��Ѻ ��ԧ/��)

#define	MAX_STRING					255