# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
#
pkgname=epsxe
_pkgname=ePSXe
pkgver=2.0.2
pkgrel=2
pkgdesc="Enhanced PSX emulator"
url="http://epsxe.com"
arch=('i686' 'x86_64')
depends=(gtk2 sdl_ttf ncurses5-compat-libs libtinfo-5 libcurl-compat)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh)
md5sums=('c75c99e831ca782d1f99c3622b0693f2'
         'eb0c46b8ae1355c589792f6be1835e47'
         '9dab41a58d7c5225ae1c60b33b215f7e')
if [[ $CARCH == "x86_64" ]]; then
    source+=("http://www.epsxe.com/files/ePSXe${pkgver//./}linux_x64.zip")
    md5sums+=('a6e92844922182c9f03343ab3e54865a')
else
    source+=("http://www.epsxe.com/files/ePSXe${pkgver//./}linux.zip")
    md5sums+=('787826ee6b0f95ea2df511dd7fd29abd')
fi

package () {
  srcpath="${srcdir}/${_pkgname}${pkgver//./}linux"
  binary="${pkgname}"
  if [[ $CARCH == "x86_64" ]]; then
      srcpath+="_x64"
      binary+="_x64"
  fi

  cd "${srcpath}"
#  install -m775 -g games -d "${pkgdir}/opt/${pkgname}/"{plugins,bios,memcards,cfg,cdimages,cheats,patches,sstates,snap}
  install -d "${pkgdir}"/usr/{share/doc/"${pkgname}",lib}

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \{\} +
  #  find . -name '*.cht' -execdir "install -Dm 644 -t \${pkgdir}/opt/${pkgname}/${pkgver}/cheats\"" \{\} +


  install -Dm 755 "${binary}" "${pkgdir}/opt/${pkgname}/${pkgname}"
#  install -Dm 644 keycodes.lst "${pkgdir}/opt/${pkgname}/keycodes.lst"

  cd "${srcdir}"
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/epsxe.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${srcdir}/epsxe.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -sf "$HOME/.${pkgname}rc" -T "${pkgdir}/opt/${pkgname}/.${pkgname}rc"
}
