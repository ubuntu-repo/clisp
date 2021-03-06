dnl Copyright (C) 1993-2002 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License.  As a special exception to the GNU General
dnl Public License, this file may be distributed as part of a program
dnl that contains a configuration script generated by Autoconf, under
dnl the same distribution terms as the rest of that program.

dnl From Bruno Haible, Marcus Daniels.

AC_PREREQ(2.13)

AC_DEFUN([CL_SOCKET],
[dnl Check whether -lsocket and maybe -lnsl is needed for the functions
dnl gethostbyname(), connect(), socket(), inet_addr(), setsockopt().
dnl On SVR4 and Solaris 2:
dnl   gethostbyname() and gethostent() in libnsl,
dnl   setsockopt() in libsocket,
dnl   libsocket requires libnsl.
dnl On SINIX-N 5.43:
dnl   gethostent() in libnsl,
dnl   gethostbyname() and setsockopt() in libsocket,
dnl   libsocket requires libnsl.
dnl Hence checking for gethostent() gives a better hint whether libnsl is
dnl needed than gethostbyname(). Once we found that, we check for setsockopt().
AC_CACHE_CHECK(whether gethostent requires -lnsl, cl_cv_lib_nsl, [
cl_cv_lib_nsl=no
AC_TRY_LINK(AC_LANG_EXTERN[char gethostent();], [gethostent();],
have_gethostent=1)
if test -z "$have_gethostent"; then
cl_save_LIBS="$LIBS"
LIBS="$LIBS -lnsl"
AC_TRY_LINK(AC_LANG_EXTERN[char gethostent();], [gethostent();],
cl_cv_lib_nsl=yes)
LIBS="$cl_save_LIBS"
fi
])
if test $cl_cv_lib_nsl = yes; then
  LIBS="$LIBS -lnsl"
fi
AC_CACHE_CHECK(whether setsockopt requires -lsocket, cl_cv_lib_socket, [
cl_cv_lib_socket=no
AC_TRY_LINK(AC_LANG_EXTERN[char setsockopt();], [setsockopt();],
have_setsockopt=1)
if test -z "$have_setsockopt"; then
cl_save_LIBS="$LIBS"
LIBS="$LIBS -lsocket"
AC_TRY_LINK(AC_LANG_EXTERN[char setsockopt();], [setsockopt();],
cl_cv_lib_socket=yes)
LIBS="$cl_save_LIBS"
fi
])
if test $cl_cv_lib_socket = yes; then
  LIBS="$LIBS -lsocket"
fi
])
