using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using VanessaCorpApp.Data;

namespace VanessaCorpApp
{
    public partial class App : Application
    {
        public override void Initialize()
        {
            AvaloniaXamlLoader.Load(this);
        }

        public override void OnFrameworkInitializationCompleted()
        {
            if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
            {
                // Создайте экземпляр ApplicationDbContext
                var context = new ApplicationDbContext();

                // Передайте контекст в MainWindow
                desktop.MainWindow = new MainWindow(context);
            }

            base.OnFrameworkInitializationCompleted();
        }
    }
}