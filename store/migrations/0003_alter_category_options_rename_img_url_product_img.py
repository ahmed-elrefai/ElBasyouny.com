# Generated by Django 5.0.6 on 2024-07-07 13:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0002_rename_img_product_img_url'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name_plural': 'categories'},
        ),
        migrations.RenameField(
            model_name='product',
            old_name='img_url',
            new_name='img',
        ),
    ]
