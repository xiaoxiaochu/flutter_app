package io.flutter.plugins;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.TextView;

public class MySplashView extends TextView {
    private Paint paint;
    public MySplashView(Context context) {
        super(context,null);
    }

    public MySplashView(Context context, AttributeSet attrs) {
        super(context, attrs,0);
    }

    public MySplashView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        paint = new Paint();
    }


    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawText("ffff",0,0,paint);
    }
}
