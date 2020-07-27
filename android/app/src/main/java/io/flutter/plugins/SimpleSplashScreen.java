package io.flutter.plugins;

import android.content.Context;
import android.os.Bundle;
import android.view.View;

import io.flutter.embedding.android.SplashScreen;

public class SimpleSplashScreen implements SplashScreen {
    @Override
    public View createSplashView(Context context, Bundle bundle) {
        return new MySplashView(context);
    }

    @Override
    public void transitionToFlutter(Runnable runnable) {
            runnable.run();
    }
}
