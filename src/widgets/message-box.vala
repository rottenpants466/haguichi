/*
 * This file is part of Haguichi, a graphical frontend for Hamachi.
 * Copyright (C) 2007-2020 Stephen Brandt <stephen@stephenbrandt.com>
 *
 * Haguichi is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 */

using Gtk;

namespace Widgets
{
    public class MessageBox : Box
    {
        private Label heading;
        private Label message;
        private ButtonBox button_box;
        
        public MessageBox ()
        {
            orientation = Orientation.VERTICAL;
            margin = 10;
            margin_top = 15;
            margin_bottom = 20;
            get_style_context().add_class ("welcome");
            
            heading = new Label (null);
            heading.wrap = true;
            heading.halign = Align.CENTER;
            heading.set_justify (Justification.CENTER);
            heading.get_style_context().add_class ("h1");
            
            message = new Label (null);
            message.wrap = true;
            message.get_style_context().add_class ("h2");
            message.get_style_context().add_class ("dim-label");
            message.halign = Align.CENTER;
            message.set_justify (Justification.CENTER);
            
            button_box = new ButtonBox (Orientation.HORIZONTAL);
            button_box.set_layout (ButtonBoxStyle.CENTER);
            button_box.spacing = 6;
            
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            pack_start (heading,    false, false, 0);
            pack_start (message,    false, false, 0);
            pack_start (button_box, false, false, 0);
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            pack_start (new Box (Orientation.VERTICAL, 0), true, true, 0);
            
            show_all();
        }
        
        public void set_message (string? _heading, string? _message)
        {
            foreach (var child in button_box.get_children())
            {
                button_box.remove (child);
            }
            
            heading.hide();
            message.hide();
            
            heading.set_markup (_heading);
            message.set_markup (_message);
            
            if (_heading != null)
            {
                heading.show();
            }
            if (_message != null)
            {
                message.show();
            }
            
            button_box.hide();
            button_box.margin_top = 0;
            
            show();
        }
        
        public void add_button (Button button)
        {
            button_box.add (button);
            button_box.margin_top = 20;
            button.show();
            button_box.show();
        }
    }
}
