FasdUAS 1.101.10   ��   ��    k             i         I     �� 	��
�� .aevtoappnull  �   � **** 	 o      ���� 0 argv  ��    k     n 
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
0 theapp        Z      ��   =       n        4    ��  
�� 
cobj   m   	 
����   o    ���� 0 argv    m     ! ! � " " 
 f a l s e  r     # $ # m    ��
�� boovtrue $ o      ���� 0 toggleonfull toggleOnFull��    r     % & % m    ��
�� boovfals & o      ���� 0 toggleonfull toggleOnFull   ' ( ' l   ��������  ��  ��   (  )�� ) O    n * + * k   ! m , ,  - . - I  ! &������
�� .miscactvnull��� ��� null��  ��   .  / 0 / I  ' ,�� 1��
�� .sysodelanull��� ��� nmbr 1 m   ' (���� ��   0  2 3 2 l   - -�� 4 5��   4 a [ Initially from http://stackoverflow.com/questions/8215501/applescript-use-lion-fullscreen     5 � 6 6 �   I n i t i a l l y   f r o m   h t t p : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 8 2 1 5 5 0 1 / a p p l e s c r i p t - u s e - l i o n - f u l l s c r e e n   3  7 8 7 r   - 0 9 : 9 m   - .��
�� boovfals : o      ���� 0 isfullscreen   8  ; < ; O  1 I = > = O   5 H ? @ ? r   < G A B A n   < E C D C 1   C E��
�� 
valL D n   < C E F E 4   @ C�� G
�� 
attr G m   A B H H � I I  A X F u l l S c r e e n F 4   < @�� J
�� 
cwin J m   > ?����  B o      ���� 0 isfullscreen   @ 4   5 9�� K
�� 
prcs K o   7 8���� 
0 theapp   > m   1 2 L L�                                                                                  sevs  alis    �  Macintosh HD               �(p�H+  �FSystem Events.app                                              �O,�椦        ����  	                CoreServices    �(b�      �斖    �F�E��E�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   <  M N M l  J J�� O P��   O * $display dialog "var " & isfullscreen    P � Q Q H d i s p l a y   d i a l o g   " v a r   "   &   i s f u l l s c r e e n N  R S R l  J J��������  ��  ��   S  T�� T Z   J m U V���� U =  J M W X W o   J K���� 0 isfullscreen   X o   K L���� 0 toggleonfull toggleOnFull V k   P i Y Y  Z [ Z O  P c \ ] \ I  T b�� ^ _
�� .prcskprsnull���     ctxt ^ m   T U ` ` � a a  f _ �� b��
�� 
faal b J   V ^ c c  d e d m   V Y��
�� eMdsKcmd e  f�� f m   Y \��
�� eMdsKctl��  ��   ] m   P Q g g�                                                                                  sevs  alis    �  Macintosh HD               �(p�H+  �FSystem Events.app                                              �O,�椦        ����  	                CoreServices    �(b�      �斖    �F�E��E�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   [  h�� h I  d i�� i��
�� .sysodelanull��� ��� nmbr i m   d e���� ��  ��  ��  ��  ��   + 4    �� j
�� 
capp j o    ���� 
0 theapp  ��     k�� k l     ��������  ��  ��  ��       �� l m n������   l ��������
�� .aevtoappnull  �   � ****�� 
0 theapp  �� 0 toggleonfull toggleOnFull�� 0 isfullscreen   m �� ���� o p��
�� .aevtoappnull  �   � ****�� 0 argv  ��   o ���� 0 argv   p ���� !���������� L������ H�� `��������
�� 
cobj�� 
0 theapp  �� 0 toggleonfull toggleOnFull
�� 
capp
�� .miscactvnull��� ��� null
�� .sysodelanull��� ��� nmbr�� 0 isfullscreen  
�� 
prcs
�� 
cwin
�� 
attr
�� 
valL
�� 
faal
�� eMdsKcmd
�� eMdsKctl
�� .prcskprsnull���     ctxt�� o��k/E�O��l/�  eE�Y fE�O*��/ N*j Olj OfE�O� *��/ *�k/��/�,E�UUO��  � ��a a lvl UOlj Y hU n � q q 
 S k y p e
�� boovfals
�� boovtrueascr  ��ޭ