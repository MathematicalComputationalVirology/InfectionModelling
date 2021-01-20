      PROGRAM corona_intracellular_model

        IMPLICIT NONE

        DOUBLE PRECISION :: Ribind,Riunbind,dr,Ric,Ta,Tb,q,f,deltr,ts,tm,te,tn,delts,deltm,delte,deltn,ksec,Tu,Tru
        DOUBLE PRECISION :: delta,deltb,Rbind,Runbind,Rc,r,bb,ddr,epss,Tr(10),d(9),b(10),dd(10),p(10),kon,koff
        DOUBLE PRECISION :: atot,tout,tmax,time,r1,tau,ftime
        DOUBLE PRECISION :: random,dtime
        DOUBLE PRECISION, ALLOCATABLE :: a(:)

        INTEGER :: i,i1,i2,i3,ii,j,k,kk,iseed,iout,kk1,kkk,iseed0
        INTEGER :: Rib,Pe,RPe,RPeC1,RPeC2,RPeC3,pp1a,pp1ab,RTC,RTPe,RTPeC(19),Nesg(9),Pesg(9),nn(10)
        INTEGER :: Ne,S,M,E,N,VIR,RTreac,RTdecay,Pebound,Rem,ReRTPeC(19)
        INTEGER, ALLOCATABLE :: RTNesg(:,:),ReRTNesg(:,:)
        INTEGER, ALLOCATABLE :: RTNe(:),ReRTNe(:)
        
        INTEGER, PARAMETER :: mxg = 700000000

        INTEGER :: nrun
        
        iseed = 423185 !956218 !754981 !586142

        !open (unit=1,file='seed.list',status='unknown')

        DO nrun=1,1

        !read(1,*)iseed
        iseed0 = iseed
        
        time = 0.0d0
        ftime = 0.0d0
        tout = 1.0d-6
        tmax = 40.00d0

        iout = 1
        dtime = 1.0d-6
        
        !!!!!Initial Condition!!!!!
        
        RTreac = 0
        RTdecay = 0
        
        Rib = 1000
        Pe = 1
        RPe = 0
        RPeC1 = 0
        RPeC2 = 0
        RPeC3 = 0
        pp1a = 0
        pp1ab = 0
        RTC = 0 !1000 !4900
        RTPe = 0
        RTPeC(:) = 0
        ReRTPeC(:) = 0
        Ne = 0
        Nesg(:) = 0        
        Pesg(:) = 0
        nn = (/ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 /)
        !nn = (/ 2, 2, 2, 2, 3, 3, 4, 4, 8, 30 /)
        S = 0
        M = 0
        E = 0
        N = 0
        VIR = 0
        ALLOCATE(RTNe(nn(10)))
        ALLOCATE(RTNesg(9,2))
        ALLOCATE(ReRTNe(nn(10)))
        ALLOCATE(ReRTNesg(9,2))
        ALLOCATE(a(148+4*SUM(nn)))
        a(:)=0d0
        RTNe(:) = 0
        RTNesg(:,:) = 0
        ReRTNe(:) = 0
        ReRTNesg(:,:) = 0      
        Rem = 0
        
        !!!!!Parameters Values!!!!!

        Ribind = 8.64d0
        Riunbind = 360d0*20
        dr = 0.11d0
        RiC = 360d0
        Ta = 0.82d0*10
        Tb = 1.34d0*10 
        Tu = 360d0
        q = 0.4d0
        delta = 0.69d0
        deltb = 0.69d0
        f = 30d0
        deltr = 0.11d0
        Rbind = 8.64d0
        Runbind = 360d0
        Rc = 360d0
        Tr = (/ 1630d0, 380d0, 138d0, 362d0, 192d0, 679d0, 278d0, 852d0, 3830d0, 21563d0 /) / 3600 / 30
        Tru = 360d0
        r = 0.7d0
        d = (/ 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0 /)
        b = (/ 8.64d0, 8.64d0, 8.64d0, 8.64d0, 8.64d0, 8.64d0, 8.64d0, 8.64d0, 8.64d0, 8.64d0 /)
        dd = (/ 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0, 0.11d0 /)
        p = (/ 1700d0, 2080d0, 2218d0, 2580d0, 2772d0, 3451d0, 3729d0, 4581d0, 8411d0, 29903d0/) / 3600 / 30
        !(/ 1000d0, 1000d0, 1000d0, 1000d0, 1000d0, 1000d0, 1000d0, 1000d0, 1000d0, 1000d0 /) / 3600 / 40
        tn = 10d0 !43d0/10
        tm = 10d0 !81d0/10
        te = 10d0 !240d0/10
        ts = 10d0 !14d0/10
        delts = 0.69d0
        deltm = 0.69d0
        delte = 0.69d0
        deltn = 0.69d0
        ksec = 0.0001 !0.01/5
        
        ! Drug parameters !
        
        epss = 0d0
        kon = 8.64d0
        koff = 3600d0

        DO WHILE ( time < tmax )
        
!        IF ( time > 20) THEN
!            Rem = 25
!        ENDIF
        
        !iRNA = 50
        !R(29) = 10
        
!        write(*,*)time,Ibind

!          IF ( time >= STtime .and. ftime <= STtime ) THEN
!          IF ( time == ftime .and. time < 0.005 ) THEN

            !!!!! Start of treatment !!!!!
            !CAM = 400
!            R(29) = 300 !10000000
!            write(*,*)time,R(29)

!          ENDIF
          
!          IF ( ftime > STtime .and. INT((time-STtime)/RTtime) > INT((ftime-STtime)/RTtime) ) THEN

            !!!!! Repeat of treatment !!!!!
            !CAM = 400
!            R(29) = 300 !10000000
!            write(*,*)time,R(29)

!          ENDIF
          
!          ftime = time

!          IF (Pe == 0 .and. Ne == 0 .and. RPe == 0) THEN
             
!             GOTO 1
          
!          ENDIF
          
          !!!!!Transition Rates!!!!!
          
          Pebound = RPe + RPeC1 + RPeC2 + RPeC3 + RTPe + SUM(RTPeC)
          
          a(1) = Ribind * DBLE(Rib) * DBLE(Pe)
          a(2) = Riunbind * DBLE(RPe)
          IF (Pe + Pebound > 1) THEN
              a(3) = dr * DBLE(Pe)
          ELSE
              a(3) = 0d0
          ENDIF
          a(4) = Ric * DBLE(RPe)
          a(5) = Ta * DBLE(RPeC1)        
          a(6) = Tu * (1-q) * DBLE(RPeC2)
          a(7) = Tu * q * DBLE(RPeC2)
          a(8) = Tb * DBLE(RPeC3)
          a(9) = delta * DBLE(pp1a)
          a(10) = deltb * DBLE(pp1ab)
          a(11) = f * DBLE(pp1a) * DBLE(pp1ab)
          a(12) = deltr * DBLE(RTC)
          a(13) = Rbind * DBLE(RTC) * DBLE(Pe)
          a(14) = Runbind * DBLE(RTPe)
          a(15) = Rc * DBLE(RTPe)
          DO i=1,9
             a(15+i) = (1/Tr(i)) * DBLE(RTPeC(2*i-1))
             a(24+i) = Tru * (1-r) * DBLE(RTPeC(2*i))
             a(33+i) = Tru * r * DBLE(RTPeC(2*i))
             a(42+i) = d(i) * DBLE(Nesg(i))
          ENDDO
          
          a(52) = (1/Tr(10)) * DBLE(RTPeC(19))
          a(53) = dr * DBLE(Ne)
          
          DO i=1,9
             a(53+i) = b(i) * DBLE(Nesg(i)) * DBLE(RTC)
          ENDDO
          
          DO i=1,9
             DO j=1,nn(i)-1
                a(62+SUM(nn(1:(i-1)))-i+1+j) = b(i) * DBLE(RTNesg(i,j)) * DBLE(RTC)
             ENDDO
          ENDDO
          
          kk = 53 + SUM(nn(1:9))
          
          DO i=1,9
             a(kk+i) = dd(i) * DBLE(RTNesg(i,nn(i)))
             a(kk+9+i) = (1/p(i)) * DBLE(RTNesg(i,nn(i)))
             a(kk+18+i) = d(i) * DBLE(Pesg(i))
          ENDDO
          
          kkk = kk + 27
          
          a(kkk+1) = b(10) * DBLE(Ne) * DBLE(RTC)
          
          DO i=1,nn(10)-1
             a(kkk+1+i) = b(10) * DBLE(RTNe(i)) * DBLE(RTC)
          ENDDO
          
          kk1 = kkk+nn(10)
          
          a(kk1+1) = dd(10) * DBLE(RTNe(nn(10)))
          a(kk1+2) = (1/p(10)) * DBLE(RTNe(nn(10)))
          
          a(kk1+3) = tn * DBLE(Pesg(1))
          a(kk1+4) = tm * DBLE(Pesg(6))
          a(kk1+5) = te * DBLE(Pesg(7))
          a(kk1+6) = ts * DBLE(Pesg(9))
          a(kk1+7) = deltn * DBLE(N)
          a(kk1+8) = deltm * DBLE(M)
          a(kk1+9) = delte * DBLE(E)
          a(kk1+10) = delts * DBLE(S)
          IF ( S > 299 .and. M > 1999 .and. N > 999 .and. E > 99 ) THEN
              a(kk1+11) = ksec * (1 - epss) * DBLE(Pe) !* (1.0d0 - DEXP(-lam * DBLE(N)))
          ELSE
              a(kk1+11) = 0d0
          ENDIF
          
          DO i=1,19
             a(91+SUM(nn)+i) = kon * DBLE(Rem) * DBLE(RTPeC(i))
          ENDDO
          
          DO i=1,19
             a(110+SUM(nn)+i) = koff * DBLE(ReRTPeC(i))
          ENDDO
          
          DO i=1,19
             a(129+SUM(nn)+i) = Runbind * DBLE(ReRTPeC(i))
          ENDDO
          
          DO i=1,9
             DO j=1,nn(i)
                a(148+SUM(nn)+SUM(nn(1:(i-1)))+j) = kon * DBLE(RTNesg(i,j)) * DBLE(Rem)
             ENDDO
          ENDDO
          
          DO i=1,9
             DO j=1,nn(i)
                a(148+SUM(nn)+SUM(nn(1:9))+SUM(nn(1:(i-1)))+j) = koff * DBLE(ReRTNesg(i,j))
             ENDDO
          ENDDO
          
          DO i=1,9
             DO j=1,nn(i)
                a(148+SUM(nn)+2*SUM(nn(1:9))+SUM(nn(1:(i-1)))+j) = Runbind * DBLE(ReRTNesg(i,j))
             ENDDO
          ENDDO
          
          DO i=1,nn(10)
             a(148+SUM(nn)+3*SUM(nn(1:9))+i) = kon * DBLE(RTNe(i)) * DBLE(Rem)
          ENDDO
          
          DO i=1,nn(10)
             a(148+SUM(nn)+3*SUM(nn(1:9))+nn(10)+i) = koff * DBLE(ReRTNe(i))
          ENDDO
          
          DO i=1,nn(10)
             a(148+SUM(nn)+3*SUM(nn(1:9))+2*nn(10)+i) = Runbind * DBLE(ReRTNe(i))
          ENDDO
        
          
          !=== Total Transition Rate ===!

          atot = 0.0d0

          DO i3=1,148+4*SUM(nn)
             atot = atot + a(i3)
          ENDDO
          
          !WRITE(*,*) atot

          !=== Compute Time Increment ===!

          r1 = random(iseed)

          tau = DLOG(1.0d0/r1)
          tau = tau / atot
          
          !WRITE(*,*) tau

          time = time + tau
          
          !Pebound = RPe + RPeC1 + RPeC2 + RPeC3 + RTPe + SUM(RTPeC)
          
          !WRITE(*,*) time,VIR !Pesg(9),Pesg(7),Pesg(6),Pesg(1)

          IF ( time >= tout ) THEN
          
           OPEN(UNIT=3, FILE='A.dat', ACCESS='APPEND', STATUS='UNKNOWN')
           WRITE(UNIT=3,FMT='(E16.8,I10,I10,I10,I10,I10)') tout,VIR,S,M,E,N
           CLOSE(UNIT=3)
           !WRITE(30,*) time,iseed0,VIR,Pebound,Pe,S,E,M,N

!            iout = iout + 1
!            tout = tout + dtime
            tout = tout + 0.1d0

!            IF ( iout == 10 ) THEN
!              iout = 1
!              IF ( dtime < 1.0d-3 ) dtime = dtime * 10.0d0
!            ENDIF

          ENDIF

          !=== Pick Reaction ===!

          r1 = random(iseed)

          r1 = r1 * atot

          i2 = 0
          atot = 0.0d0

          DO WHILE ( atot < r1 )

            i2 = i2 + 1
            atot = atot + a(i2)

          ENDDO
          
          !if(time.gt.500)write(159,*)i2,time
          !WRITE(*,*) i2
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

          IF ( i2 == 1 ) THEN

            !=== Rib binding to PeRNA ===!

            Rib = Rib - 1
            Pe = Pe - 1
            RPe = RPe + 1

          ENDIF

          IF ( i2 == 2 ) THEN

            !=== RibPeRNA unbind ===!

            Pe = Pe + 1
            Rib = Rib+ 1
            RPe = RPe - 1

          ENDIF

          IF ( i2 == 3 ) THEN

            !=== (+)RNA degradation ===!

            Pe = Pe - 1

          ENDIF

          IF ( i2 == 4 ) THEN

            !=== RibPeRNA complex becomes competent to produce proteins ===!

            RPe = RPe - 1
            RPeC1 = RPeC1 + 1

          ENDIF

          IF ( i2 == 5 ) THEN
          
            !=== RibPeRNA complex becomes competent to produce pp1ab ===!

            RPeC1 = RPeC1 - 1
            RPeC2 = RPeC2 + 1

          ENDIF

          IF ( i2 == 6 ) THEN

            !=== pp1a formation ===!

            RPeC2 = RPeC2 - 1
            Pe = Pe + 1
            Rib = Rib + 1
            pp1a = pp1a + 1

          ENDIF
          
          IF ( i2 == 7 ) THEN
          
            !=== RibPeRNA complex becomes competent to produce pp1ab ===!

            RPeC2 = RPeC2 - 1
            RPeC3 = RPeC3 + 1

          ENDIF
          
          IF ( i2 == 8 ) THEN
          
            !=== pp1ab formation ===!

            RPeC3 = RPeC3 - 1
            Pe = Pe + 1
            Rib = Rib + 1
            pp1ab = pp1ab + 1

          ENDIF
          
          IF ( i2 == 9 ) THEN
          
            !=== pp1a degradation ===!

            pp1a = pp1a - 1

          ENDIF
          
          IF ( i2 == 10 ) THEN
          
            !=== pp1ab degradation ===!

            pp1ab = pp1ab - 1

          ENDIF
          
          IF ( i2 == 11 ) THEN
          
            !=== RTC production ===!

            pp1a = pp1a - 1
            pp1ab = pp1ab - 1
            RTC = RTC + 1
            RTreac = RTreac + 1

          ENDIF
          
          IF ( i2 == 12 ) THEN

            !=== RTC degradation ===!

            RTC = RTC - 1
            RTdecay = RTdecay + 1

          ENDIF
          
          IF ( i2 == 13 ) THEN

            !=== RTC binding to (+)RNA ===!

            RTC = RTC - 1
            Pe = Pe - 1
            RTPe = RTPe + 1

          ENDIF
          
          IF ( i2 == 14 ) THEN

            !=== RTPeRNA unbind ===!

            RTPe = RTPe - 1
            RTC = RTC + 1
            Pe = Pe + 1

          ENDIF
          
          IF ( i2 == 15 ) THEN

            !=== RTC(+)RNA complex becomes competent ===!

            RTPe = RTPe - 1
            RTPeC(1) = RTPeC(1) + 1

          ENDIF
          
          IF ( i2 .GE. 16 .AND. i2 .LE. 24 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-15
            RTPeC(2*i1-1) = RTPeC(2*i1-1) - 1
            RTPeC(2*i1) = RTPeC(2*i1) + 1

          ENDIF
          
          IF ( i2 .GE. 25 .AND. i2 .LE. 33 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-24
            RTPeC(2*i1) = RTPeC(2*i1) - 1
            Nesg(i1) = Nesg(i1) + 1
            RTC = RTC + 1
            Pe = Pe + 1

          ENDIF
          
          IF ( i2 .GE. 34 .AND. i2 .LE. 42 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-33
            RTPeC(2*i1) = RTPeC(2*i1) - 1
            RTPeC(2*i1+1) = RTPeC(2*i1+1) + 1

          ENDIF
          
          IF ( i2 .GE. 43 .AND. i2 .LE. 51 ) THEN

            !=== (-)RNA production ===!
            
            i1 = i2-42
            Nesg(i1) = Nesg(i1) - 1

          ENDIF
          
          IF ( i2 == 52 ) THEN

            !=== RTC binding to (-)RNA1 ===!

            RTC = RTC + 1
            Pe = Pe + 1
            Ne = Ne + 1
            RTPeC(19) = RTPeC(19) - 1

          ENDIF
          
          IF ( i2 == 53 ) THEN

            !=== (-)RNA degradation ===!

            Ne = Ne - 1

          ENDIF
          
          IF ( i2 .GE. 54 .AND. i2 .LE. 62 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-53
            Nesg(i1) = Nesg(i1) - 1
            RTC = RTC - 1
            RTNesg(i1,1) = RTNesg(i1,1) + 1

          ENDIF
          
          DO i = 1,9
             IF ( i2 .GE. 62+SUM(nn(1:i-1))-i+1+1 .AND. i2 .LE. 62+SUM(nn(1:i))-i ) THEN
                i1 = i2 - (62+SUM(nn(1:i-1))-i+1)
                RTNesg(i,i1) = RTNesg(i,i1) - 1
                RTC = RTC -1
                RTNesg(i,i1+1) = RTNesg(i,i1+1) + 1
             ENDIF
          ENDDO
          
          IF ( i2 .GE. 53 + SUM(nn(1:9)) + 1 .AND. i2 .LE. 53 + SUM(nn(1:9)) + 9 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(53 + SUM(nn(1:9)))
            RTNesg(i1,nn(i1)) = RTNesg(i1,nn(i1)) - 1

          ENDIF
          
          IF ( i2 .GE. 62 + SUM(nn(1:9)) + 1 .AND. i2 .LE. 62 + SUM(nn(1:9)) + 9 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(62 + SUM(nn(1:9)))
            Pesg(i1) = Pesg(i1) + 1
            RTNesg(i1,nn(i1)) =  RTNesg(i1,nn(i1)) - 1
            RTC = RTC + 1
            IF (nn(i1) > 1) THEN
                RTNesg(i1,nn(i1)-1) =  RTNesg(i1,nn(i1)-1) + 1
            ELSE
                Nesg(i1) = Nesg(i1) + 1
            ENDIF

          ENDIF
          
          IF ( i2 .GE. 71 + SUM(nn(1:9)) + 1 .AND. i2 .LE. 71 + SUM(nn(1:9)) + 9 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(71 + SUM(nn(1:9)))
            Pesg(i1) = Pesg(i1) - 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn(1:9)) ) THEN

            !=== RTNeRNA1 unbind ===!

            Ne = Ne - 1
            RTC = RTC - 1
            RTNe(1) = RTNe(1) + 1

          ENDIF
          
          IF ( i2 .GE. 81 + SUM(nn(1:9)) + 1 .AND. i2 .LE. 81 + SUM(nn) - 1 ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(81 + SUM(nn(1:9)))
            RTNe(i1) = RTNe(i1) - 1
            RTC = RTC - 1
            RTNe(i1+1) = RTNe(i1+1) + 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) ) THEN

            !=== RTC(-)RNA1 complex becomes competent ===!

            RTNe(nn(10)) = RTNe(nn(10)) - 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 1 ) THEN

            !=== (+)RNA production ===!

            Pe = Pe + 1
            RTNe(nn(10)) =  RTNe(nn(10)) - 1
            RTC = RTC + 1
            IF (nn(10) > 1) THEN
                RTNe(nn(10)-1) =  RTNe(nn(10)-1) + 1
            ELSE
                Ne = Ne + 1
            ENDIF

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 2 ) THEN

            !=== N protein production ===!

            N = N + 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 3 ) THEN

            !=== M protein production ===!

            M = M + 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 4 ) THEN

            !=== E protein production ===!

            E = E + 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 5 ) THEN

            !=== S protein production ===!

            S = S + 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 6 ) THEN

            !=== N protein degradation ===!

            N = N - 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 7 ) THEN

            !=== M protein degradation ===!

            M = M - 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 8 ) THEN

            !=== E protein degradation ===!

            E = E - 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 9 ) THEN

            !=== S protein degradation ===!

            S = S - 1

          ENDIF
          
          IF ( i2 == 81 + SUM(nn) + 10 ) THEN

            !=== Virion release ===!

            Pe = Pe - 1
            S = S - 300
            M = M - 2000
            N = N - 1000
            E = E - 100
            VIR = VIR + 1
            !go to 1

          ENDIF
          
          IF ( i2 .GE. 92 + SUM(nn) .AND. i2 .LE. 110 + SUM(nn) ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(91 + SUM(nn))
            RTPeC(i1) = RTPeC(i1) - 1
            Rem = Rem - 1
            ReRTPeC(i1) = ReRTPeC(i1) + 1

          ENDIF
          
          IF ( i2 .GE. 111 + SUM(nn) .AND. i2 .LE. 129 + SUM(nn) ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(110 + SUM(nn))
            RTPeC(i1) = RTPeC(i1) + 1
            Rem = Rem + 1
            ReRTPeC(i1) = ReRTPeC(i1) - 1

          ENDIF
          
          IF ( i2 .GE. 130 + SUM(nn) .AND. i2 .LE. 148 + SUM(nn) ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(129 + SUM(nn))
            RTC = RTC + 1
            Pe = Pe + 1
            ReRTPeC(i1) = ReRTPeC(i1) - 1

          ENDIF
          
          DO i = 1,9
             IF ( i2 .GE. 148+SUM(nn)+SUM(nn(1:i-1))+1 .AND. i2 .LE. 148+SUM(nn)+SUM(nn(1:i-1))+nn(i) ) THEN
                i1 = i2 - 148+SUM(nn)+SUM(nn(1:i-1))
                RTNesg(i,i1) = RTNesg(i,i1) - 1
                Rem = Rem -1
                ReRTNesg(i,i1) = ReRTNesg(i,i1) + 1
             ENDIF
          ENDDO
          
          DO i = 1,9
             IF ( i2 .GE. 148+SUM(nn)+SUM(nn(1:9))+SUM(nn(1:i-1))+1 .AND. & 
                  i2 .LE. 148+SUM(nn)+SUM(nn(1:9))+SUM(nn(1:i-1))+nn(i) ) THEN
                i1 = i2 - 148+SUM(nn)+SUM(nn(1:9))+SUM(nn(1:i-1))
                RTNesg(i,i1) = RTNesg(i,i1) + 1
                Rem = Rem +1
                ReRTNesg(i,i1) = ReRTNesg(i,i1) - 1
             ENDIF
          ENDDO
          
          DO i = 1,9
             IF ( i2 .GE. 148+SUM(nn)+2*SUM(nn(1:9))+SUM(nn(1:i-1))+1 .AND. & 
                  i2 .LE. 148+SUM(nn)+2*SUM(nn(1:9))+SUM(nn(1:i-1))+nn(i) ) THEN
                i1 = i2 - 148+SUM(nn)+2*SUM(nn(1:9))+SUM(nn(1:i-1))
                IF (i1 == 1) THEN
                    RTC = RTC +1
                    ReRTNesg(i,i1) = ReRTNesg(i,i1) - 1
                    Nesg(i) = Nesg(i) + 1
                ELSE
                    RTC = RTC +1
                    ReRTNesg(i,i1) = ReRTNesg(i,i1) - 1
                    RTNesg(i,i1-1) = RTNesg(i,i1-1) + 1
                ENDIF
             ENDIF
          ENDDO
          
          IF ( i2 .GE. 148+SUM(nn)+3*SUM(nn(1:9))+1 .AND. i2 .LE. 148+SUM(nn)+3*SUM(nn(1:9))+nn(10) ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(148+SUM(nn)+3*SUM(nn(1:9)))
            RTNe(i1) = RTNe(i1) - 1
            Rem = Rem - 1
            ReRTNe(i1) = ReRTNe(i1) + 1

          ENDIF
          
          IF ( i2 .GE. 148+SUM(nn)+3*SUM(nn(1:9))+nn(10)+1 .AND. i2 .LE. 148+SUM(nn)+3*SUM(nn(1:9))+2*nn(10) ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(148+SUM(nn)+3*SUM(nn(1:9))+nn(10))
            RTNe(i1) = RTNe(i1) + 1
            Rem = Rem + 1
            ReRTNe(i1) = ReRTNe(i1) - 1

          ENDIF
          
          IF ( i2 .GE. 148+SUM(nn)+3*SUM(nn(1:9))+2*nn(10)+1 .AND. i2 .LE. 148+SUM(nn)+3*SUM(nn(1:9))+3*nn(10) ) THEN

            !=== (-)RNA production ===!
           
            i1 = i2-(148+SUM(nn)+3*SUM(nn(1:9))+2*nn(10))
            IF (i1 == 1) THEN
                RTC = RTC + 1
                ReRTNe(i1) = ReRTNe(i1) - 1
                Ne = Ne + 1
            ELSE
                RTC = RTC + 1
                ReRTNe(i1) = ReRTNe(i1) - 1
                RTNe(i1-1) = RTNe(i1-1) + 1
            ENDIF
          ENDIF

        ENDDO
        
        DEALLOCATE(RTNe)
        DEALLOCATE(RTNesg)
        DEALLOCATE(ReRTNe)
        DEALLOCATE(ReRTNesg)
        DEALLOCATE(a)

!1      CONTINUE


        write(*,*)nrun,time,VIR

        ENDDO
      
      END PROGRAM
      
      !!!!! Creating a Random Number !!!!!
      
      DOUBLE PRECISION FUNCTION RANDOM (ISEED)

        IMPLICIT NONE

        !=== ARGUMENTS ===!

        INTEGER, INTENT(INOUT) :: iseed

        !=== VARIABLES ===!

        INTEGER :: hi,lo,test

        INTEGER, PARAMETER :: ae = 16807
        INTEGER, PARAMETER :: m = 2147483647
        INTEGER, PARAMETER :: q = 127773
        INTEGER, PARAMETER :: re = 2836


        hi = INT(iseed/q)
        lo = MODULO(iseed,q)

        test = ae * lo - re * hi

        IF ( test > 0 ) THEN

          iseed = test

        ELSE

          iseed = test + m

        ENDIF

        RANDOM = DBLE(iseed) / DBLE(m)

        RETURN

      END FUNCTION RANDOM
