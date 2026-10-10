package com.xion.player;

import android.os.Bundle;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private WebView webView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        webView = new WebView(this);
        setContentView(webView);

        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDomStorageEnabled(true);
        webSettings.setAllowFileAccess(true);
        webSettings.setAllowContentAccess(true);

        webView.setWebViewClient(new WebViewClient());
        webView.addJavascriptInterface(new WebAppInterface(), "AndroidBridge");

        // Загрузка интерфейса из assets
        webView.loadUrl("file:///android_asset/index.html");
    }

    public class WebAppInterface {
        @JavascriptInterface
        public void openChooser() {
            runOnUiThread(() -> Toast.makeText(MainActivity.this, "Открытие выбора файлов...", Toast.LENGTH_SHORT).show());
        }
    }
}
