FROM linuxserver/webtop:ubuntu-xfce

RUN apt update
COPY xrdp-installer-1.4.8.sh xrdp-installer-1.4.8.sh

RUN ./xrdp-installer-1.4.8.sh -s

RUN rm -rf \
		/var/lib/apt/lists/* \
		/xrdp-installer-1.4.8.sh \
		/etc/s6-overlay/s6-rc.d/user/contents.d/svc-de \
		/etc/s6-overlay/s6-rc.d/user/contents.d/svc-docker \
		/etc/s6-overlay/s6-rc.d/user/contents.d/svc-kasmvnc \
		/etc/s6-overlay/s6-rc.d/user/contents.d/svc-kclient \
		/etc/s6-overlay/s6-rc.d/user/contents.d/svc-nginx \
		/etc/s6-overlay/s6-rc.d/svc-de \
		/etc/s6-overlay/s6-rc.d/svc-docker \
		/etc/s6-overlay/s6-rc.d/svc-kasmvnc \
		/etc/s6-overlay/s6-rc.d/svc-kclient \
		/etc/s6-overlay/s6-rc.d/svc-nginx

RUN echo "**** default firefox settings ****" && \
  FIREFOX_SETTING="/usr/lib/firefox/browser/defaults/preferences/firefox.js" && \
  echo '' > ${FIREFOX_SETTING} && \
  echo 'pref("browser.aboutwelcome.enabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("browser.download.dir", "/config/downloads");' >> ${FIREFOX_SETTING} && \
  echo 'pref("browser.download.folderList", 2);' >> ${FIREFOX_SETTING} && \
  echo 'pref("browser.sessionstore.resume_from_crash", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("browser.tabs.closeWindowWithLastTab", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("browser.warnOnQuitShortcut", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.healthreport.service.enabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.healthreport.uploadEnabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.policy.dataSubmissionEnabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.policy.firstRunURL", "");' >> ${FIREFOX_SETTING} && \
  echo 'pref("trailhead.firstrun.branches", "nofirstrun-empty");' >> ${FIREFOX_SETTING} && \
  echo 'pref("toolkit.telemetry.reportingpolicy.firstRun", false);' >> ${FIREFOX_SETTING} && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

ENV FF_PARAMS= \
	RDP_PASS=pass

COPY root /

EXPOSE 3389
