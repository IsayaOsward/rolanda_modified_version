# Keep Google Error Prone annotations
-keep class com.google.errorprone.annotations.** { *; }
-dontwarn com.google.errorprone.annotations.**

# Keep JavaX annotations
-keep class javax.annotation.** { *; }
-dontwarn javax.annotation.**

# Keep JavaX concurrent annotations
-keep class javax.annotation.concurrent.** { *; }
-dontwarn javax.annotation.concurrent.**

# Prevent stripping R8 optimizations for Tink classes (if applicable)
-keep class com.google.crypto.tink.** { *; }
-dontwarn com.google.crypto.tink.**
