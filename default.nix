{ pkgs ? import
    (builtins.fetchTarball {
      name = "nixpkgs-unstable-20240108140920";
      url = "https://github.com/NixOS/nixpkgs/archive/317484b1ead87b9c1b8ac5261a8d2dd748a0492d.tar.gz";
      sha256 = "sha256-mKGJ3sPsT6//s+Knglai5YflJUF2DGj7Ai6Ynopz0kI=";
    })
    { }
}:

let
  inherit (pkgs) lib stdenv;
  NIX_LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
    # libz.out
    zlib

    # source: https://github.com/AvaloniaUI/Avalonia/issues/3020#issuecomment-533881126
    fontconfig
    xorg.libX11

    xorg.libXrender
    xorg.libXtst
    xorg.libXext
    xorg.libXi
    freetype
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
in
pkgs.writeShellScriptBin "java" ''
  export NIX_LD_LIBRARY_PATH='${NIX_LD_LIBRARY_PATH}'${"\${NIX_LD_LIBRARY_PATH:+':'}$NIX_LD_LIBRARY_PATH"}
  export NIX_LD='${NIX_LD}'
  /home/koppor/idea-IU-233.13135.103/jbr/bin/java -classpath /home/koppor/idea-IU-233.13135.103/lib/platform-loader.jar:/home/koppor/idea-IU-233.13135.103/lib/util-8.jar:/home/koppor/idea-IU-233.13135.103/lib/util.jar:/home/koppor/idea-IU-233.13135.103/lib/app-client.jar:/home/koppor/idea-IU-233.13135.103/lib/util_rt.jar:/home/koppor/idea-IU-233.13135.103/lib/product.jar:/home/koppor/idea-IU-233.13135.103/lib/product-client.jar:/home/koppor/idea-IU-233.13135.103/lib/app.jar:/home/koppor/idea-IU-233.13135.103/lib/lib-client.jar:/home/koppor/idea-IU-233.13135.103/lib/modules.jar:/home/koppor/idea-IU-233.13135.103/lib/lib.jar:/home/koppor/idea-IU-233.13135.103/lib/stats.jar:/home/koppor/idea-IU-233.13135.103/lib/jps-model.jar:/home/koppor/idea-IU-233.13135.103/lib/external-system-rt.jar:/home/koppor/idea-IU-233.13135.103/lib/rd.jar:/home/koppor/idea-IU-233.13135.103/lib/protobuf.jar:/home/koppor/idea-IU-233.13135.103/lib/bouncy-castle.jar:/home/koppor/idea-IU-233.13135.103/lib/forms_rt.jar:/home/koppor/idea-IU-233.13135.103/lib/intellij-test-discovery.jar:/home/koppor/idea-IU-233.13135.103/lib/annotations.jar:/home/koppor/idea-IU-233.13135.103/lib/groovy.jar:/home/koppor/idea-IU-233.13135.103/lib/externalProcess-rt.jar:/home/koppor/idea-IU-233.13135.103/lib/async-profiler.jar:/home/koppor/idea-IU-233.13135.103/lib/byte-buddy-agent.jar:/home/koppor/idea-IU-233.13135.103/lib/error-prone-annotations.jar:/home/koppor/idea-IU-233.13135.103/lib/grpc.jar:/home/koppor/idea-IU-233.13135.103/lib/idea_rt.jar:/home/koppor/idea-IU-233.13135.103/lib/intellij-coverage-agent-1.0.738.jar:/home/koppor/idea-IU-233.13135.103/lib/jsch-agent.jar:/home/koppor/idea-IU-233.13135.103/lib/junit4.jar:/home/koppor/idea-IU-233.13135.103/lib/nio-fs.jar:/home/koppor/idea-IU-233.13135.103/lib/ant/lib/ant.jar -XX:ErrorFile=/home/koppor/java_error_in_idea_%p.log -XX:HeapDumpPath=/home/koppor/java_error_in_idea_.hprof -Xms128m -Xmx2048m -XX:ReservedCodeCacheSize=512m -XX:+UseG1GC -XX:SoftRefLRUPolicyMSPerMB=50 -XX:CICompilerCount=2 -XX:+HeapDumpOnOutOfMemoryError -XX:-OmitStackTraceInFastThrow -XX:+IgnoreUnrecognizedVMOptions -XX:CompileCommand=exclude,com/intellij/openapi/vfs/impl/FilePartNodeRoot,trieDescend -ea -Dsun.io.useCanonCaches=false -Dsun.java2d.metal=true -Djbr.catch.SIGABRT=true '-Djdk.http.auth.tunneling.disabledSchemes=""' -Djdk.attach.allowAttachSelf=true -Djdk.module.illegalAccess.silent=true -Dkotlinx.coroutines.debug=off -Dsun.tools.attach.tmp.only=true -Dawt.lock.fair=true -Djb.vmOptionsFile=/home/koppor/idea-IU-233.13135.103/bin/idea64.vmoptions -Djava.system.class.loader=com.intellij.util.lang.PathClassLoader -Didea.vendor.name=JetBrains -Didea.paths.selector=IntelliJIdea2023.3 -Djna.boot.library.path=/home/koppor/idea-IU-233.13135.103/lib/jna/amd64 -Dpty4j.preferred.native.folder=/home/koppor/idea-IU-233.13135.103/lib/pty4j -Djna.nosys=true -Djna.noclasspath=true -Dintellij.platform.runtime.repository.path=/home/koppor/idea-IU-233.13135.103/modules/module-descriptors.jar -Dsplash=true -Daether.connector.resumeDownloads=false --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.ref=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED --add-opens=java.base/java.nio=ALL-UNNAMED --add-opens=java.base/java.nio.charset=ALL-UNNAMED --add-opens=java.base/java.text=ALL-UNNAMED --add-opens=java.base/java.time=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens=java.base/java.util.concurrent.locks=ALL-UNNAMED --add-opens=java.base/jdk.internal.vm=ALL-UNNAMED --add-opens=java.base/sun.nio.ch=ALL-UNNAMED --add-opens=java.base/sun.nio.fs=ALL-UNNAMED --add-opens=java.base/sun.security.ssl=ALL-UNNAMED --add-opens=java.base/sun.security.util=ALL-UNNAMED --add-opens=java.base/sun.net.dns=ALL-UNNAMED --add-opens=java.desktop/com.sun.java.swing.plaf.gtk=ALL-UNNAMED --add-opens=java.desktop/java.awt=ALL-UNNAMED --add-opens=java.desktop/java.awt.dnd.peer=ALL-UNNAMED --add-opens=java.desktop/java.awt.event=ALL-UNNAMED --add-opens=java.desktop/java.awt.image=ALL-UNNAMED --add-opens=java.desktop/java.awt.peer=ALL-UNNAMED --add-opens=java.desktop/java.awt.font=ALL-UNNAMED --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.desktop/javax.swing.plaf.basic=ALL-UNNAMED --add-opens=java.desktop/javax.swing.text.html=ALL-UNNAMED --add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED --add-opens=java.desktop/sun.awt.datatransfer=ALL-UNNAMED --add-opens=java.desktop/sun.awt.image=ALL-UNNAMED --add-opens=java.desktop/sun.awt=ALL-UNNAMED --add-opens=java.desktop/sun.font=ALL-UNNAMED --add-opens=java.desktop/sun.java2d=ALL-UNNAMED --add-opens=java.desktop/sun.swing=ALL-UNNAMED --add-opens=java.desktop/com.sun.java.swing=ALL-UNNAMED --add-opens=jdk.attach/sun.tools.attach=ALL-UNNAMED --add-opens=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-opens=jdk.internal.jvmstat/sun.jvmstat.monitor=ALL-UNNAMED --add-opens=jdk.jdi/com.sun.tools.jdi=ALL-UNNAMED com.intellij.idea.Main
''
