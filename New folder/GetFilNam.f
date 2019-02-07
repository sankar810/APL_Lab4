      CHARACTER F*128, FN*128, FULLNAME*128

      PRINT*, 'ENTER FILE NAME:'

      READ *, F 

      FN = FULLNAME( F ) 

      PRINT *, 'PATH IS: ',FN

      END 

      CHARACTER*128 FUNCTION FULLNAME( NAME ) 

      CHARACTER NAME*(*), PREFIX*128

C          This assumes C shell.

C           Leave absolute path names unchanged. 

C           If name starts with '~/', replace tilde with home 

C           directory; otherwise prefix relative path name with 

C           path to current directory. 

      IF ( NAME(1:1) .EQ. '/' ) THEN 

            FULLNAME = NAME 

      ELSE IF ( NAME(1:2) .EQ. '~/' ) THEN 

            CALL GETENV( 'HOME', PREFIX ) 

            FULLNAME = PREFIX(:LNBLNK(PREFIX)) // 

&                         NAME(2:LNBLNK(NAME)) 

      ELSE 

            CALL GETCWD( PREFIX ) 

            FULLNAME = PREFIX(:LNBLNK(PREFIX)) // 

&                         '/' // NAME(:LNBLNK(NAME)) 

      ENDIF 

      RETURN 

      END

