FasdUAS 1.101.10   ��   ��    k             i         I     �� 	��
�� .aevtoappnull  �   � **** 	 o      ���� 0 argv  ��    k     � 
 
     l      ��  ��   [U
    	Toggle an application from full screen to non full screen (or the reverse).
    	Parameters:
		1: application name(ie, Chrome)
     		2: boolean (true/false).
			When true ensure that the application is in full screen mode (if not, make it so)
			When false ensure that the application is NOT in full screen mode (if not, make it so)
	     �  � 
         	 T o g g l e   a n   a p p l i c a t i o n   f r o m   f u l l   s c r e e n   t o   n o n   f u l l   s c r e e n   ( o r   t h e   r e v e r s e ) . 
         	 P a r a m e t e r s : 
 	 	 1 :   a p p l i c a t i o n   n a m e ( i e ,   C h r o m e ) 
           	 	 2 :   b o o l e a n   ( t r u e / f a l s e ) . 
 	 	 	 W h e n   t r u e   e n s u r e   t h a t   t h e   a p p l i c a t i o n   i s   i n   f u l l   s c r e e n   m o d e   ( i f   n o t ,   m a k e   i t   s o ) 
 	 	 	 W h e n   f a l s e   e n s u r e   t h a t   t h e   a p p l i c a t i o n   i s   N O T   i n   f u l l   s c r e e n   m o d e   ( i f   n o t ,   m a k e   i t   s o ) 
 	      r         n         4    �� 
�� 
cobj  m    ����   o     ���� 0 argv    o      ���� 
0 theapp        Z    -  ��   A        l    ����  I   �� ��
�� .corecnte****       ****  o    ���� 0 argv  ��  ��  ��    m    ����   r       !   m    ��
�� boovtrue ! o      ���� 
0 toggle  ��    k    - " "  # $ # r     % & % m    ��
�� boovfals & o      ���� 
0 toggle   $  '�� ' Z    - ( )�� * ( =   ! + , + n     - . - 4    �� /
�� 
cobj / m    ����  . o    ���� 0 argv   , m      0 0 � 1 1 
 f a l s e ) r   $ ' 2 3 2 m   $ %��
�� boovtrue 3 o      ���� 0 toggleonfull toggleOnFull��   * r   * - 4 5 4 m   * +��
�� boovfals 5 o      ���� 0 toggleonfull toggleOnFull��     6 7 6 l  . .��������  ��  ��   7  8�� 8 O   . � 9 : 9 k   5 � ; ;  < = < I  5 :������
�� .miscactvnull��� ��� null��  ��   =  > ? > l  ; ;�� @ A��   @   delay 1    A � B B    d e l a y   1 ?  C D C l   ; ;�� E F��   E a [ Initially from http://stackoverflow.com/questions/8215501/applescript-use-lion-fullscreen     F � G G �   I n i t i a l l y   f r o m   h t t p : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 8 2 1 5 5 0 1 / a p p l e s c r i p t - u s e - l i o n - f u l l s c r e e n   D  H I H r   ; > J K J m   ; <��
�� boovfals K o      ���� 0 isfullscreen   I  L M L O  ? W N O N O   C V P Q P r   J U R S R n   J S T U T 1   Q S��
�� 
valL U n   J Q V W V 4   N Q�� X
�� 
attr X m   O P Y Y � Z Z  A X F u l l S c r e e n W 4   J N�� [
�� 
cwin [ m   L M����  S o      ���� 0 isfullscreen   Q 4   C G�� \
�� 
prcs \ o   E F���� 
0 theapp   O m   ? @ ] ]�                                                                                  sevs  alis    �  Macintosh HD               �(p�H+  �FSystem Events.app                                              �O,�椦        ����  	                CoreServices    �(b�      �斖    �F�E��E�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   M  ^ _ ^ l  X X��������  ��  ��   _  `�� ` Z   X � a b���� a G   X c c d c =  X [ e f e o   X Y���� 
0 toggle   f m   Y Z��
�� boovtrue d =  ^ a g h g o   ^ _���� 0 isfullscreen   h o   _ `���� 0 toggleonfull toggleOnFull b k   f  i i  j k j O  f } l m l I  j |�� n o
�� .prcskprsnull���     ctxt n m   j m p p � q q  f o �� r��
�� 
faal r J   p x s s  t u t m   p s��
�� eMdsKcmd u  v�� v m   s v��
�� eMdsKctl��  ��   m m   f g w w�                                                                                  sevs  alis    �  Macintosh HD               �(p�H+  �FSystem Events.app                                              �O,�椦        ����  	                CoreServices    �(b�      �斖    �F�E��E�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   k  x�� x l  ~ ~�� y z��   y   delay 1    z � { {    d e l a y   1��  ��  ��  ��   : 4   . 2�� |
�� 
capp | o   0 1���� 
0 theapp  ��     }�� } l     ��������  ��  ��  ��       
�� ~  ���������������   ~ ����������������
�� .aevtoappnull  �   � ****�� 
0 theapp  �� 
0 toggle  �� 0 isfullscreen  �� 0 toggleonfull toggleOnFull��  ��  ��    �� ���� � ���
�� .aevtoappnull  �   � ****�� 0 argv  ��   � ���� 0 argv   � �������� 0�������� ]������ Y���� p��������
�� 
cobj�� 
0 theapp  
�� .corecnte****       ****�� 
0 toggle  �� 0 toggleonfull toggleOnFull
�� 
capp
�� .miscactvnull��� ��� null�� 0 isfullscreen  
�� 
prcs
�� 
cwin
�� 
attr
�� 
valL
�� 
bool
�� 
faal
�� eMdsKcmd
�� eMdsKctl
�� .prcskprsnull���     ctxt�� ���k/E�O�j l eE�Y fE�O��l/�  eE�Y fE�O*��/ P*j OfE�O� *��/ *�k/��/�,E�UUO�e 
 �� �& � a a a a lvl UOPY hU � � � � 
 S k y p e
�� boovfals
�� boovfals
�� boovfals��  ��  ��  ascr  ��ޭ