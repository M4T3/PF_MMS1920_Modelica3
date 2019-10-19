package Modelica_Gruppe_3_Flaschenzug
  model Decke
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Aufhaengung annotation(
      Placement(visible = true, transformation(origin = {-10, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Aufhaengung.s = 0;
    annotation(
      Icon(graphics = {Rectangle(origin = {8, -89}, fillColor = {134, 134, 134}, fillPattern = FillPattern.Backward, extent = {{-94, 3}, {86, -3}})}, coordinateSystem(initialScale = 0.1)));
  end Decke;

  connector Port_F_s
    Real s(unit="m") "Weg in [m]";
    flow Real F(unit="N") "Kraft in [N]";
    annotation(
      Icon(graphics = {Rectangle(fillColor = {0, 0, 144}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Text(origin = {2, 1}, extent = {{-32, 15}, {32, -15}}, textString = "F<->s")}));
  end Port_F_s;

  model Rolle
    Port_F_s Lager_Rolle_1 annotation(
      Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_F_s port_Seil_input annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Port_F_s port_Seil_output annotation(
      Placement(visible = true, transformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    port_Seil_input.s + port_Seil_output.s = 2 *Lager_Rolle_1.s;
    port_Seil_input.F + port_Seil_output.F = Lager_Rolle_1.F;
    port_Seil_input.F = port_Seil_output.F;
    annotation(
      Icon(graphics = {Ellipse(fillColor = {202, 202, 202}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Ellipse(origin = {6, -6}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {6, -6}}, endAngle = 360)}));
  end Rolle;

  model Masse
    Modelica_Gruppe_3_Flaschenzug.Port_F_s port_Masse annotation(
      Placement(visible = true, transformation(origin = {2, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    constant Real g = 9.81 "Erdbeschleunigung in [m/s²]";
    parameter Real m = 1 "Masse in [kg]";
  equation
    port_Masse.F = m * g;
    annotation(
      Icon(graphics = {Polygon(origin = {0, -50}, fillPattern = FillPattern.Solid, points = {{-60, -30}, {60, -30}, {20, 30}, {-20, 30}, {-60, -30}}), Text(origin = {5, -55}, lineColor = {255, 255, 255}, extent = {{-35, 13}, {35, -13}}, textString = "Masse")}));
  end Masse;

  model Hand
    Modelica_Gruppe_3_Flaschenzug.Port_F_s Zug_Hand_F_s annotation(
      Placement(visible = true, transformation(origin = {8, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {6, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Zug_Hand_F_s.s = sin(time);
    annotation(
      Icon(graphics = {Ellipse(origin = {10, -20}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{-44, 22}, {38, -4}}, endAngle = 360), Ellipse(origin = {-30, 21}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {-4, 27}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {14, 27}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360), Ellipse(origin = {32, 23}, fillColor = {255, 170, 127}, fillPattern = FillPattern.Solid, extent = {{10, -25}, {-4, 31}}, endAngle = 360)}));
  end Hand;

  model Seil
  Modelica_Gruppe_3_Flaschenzug.Port_F_s Seil_oben annotation(
      Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Gruppe_3_Flaschenzug.Port_F_s Seil_unten annotation(
      Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Seil_oben.s = Seil_unten.s;
    Seil_oben.F + Seil_unten.F = 0;
  annotation(
      Icon(graphics = {Rectangle(origin = {1, -1}, fillColor = {198, 159, 3}, fillPattern = FillPattern.Forward, extent = {{-5, 77}, {3, -75}})}));end Seil;

  connector Port_Electric
    Real u(unit="V") "Spannung in [V]";
    flow Real i(unit="A") "elektrischer Strom [A]";
    annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-80, 80}, {80, -80}}), Text(origin = {-1, 1}, extent = {{-73, 47}, {73, -47}}, textString = "Port_Electrical")}));
  end Port_Electric;

  model Steckdose
  
  constant Real PI = Modelica.Constants.pi;
  constant Real U_max(unit="V") = 325.2691; //Spitzenspannung 325V bei 230V Effektiv
  
  Port_Electric port_Steckdose annotation(
      Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

  port_Steckdose.u = U_max*sin(2*PI*50*time); //Effektive Spannung 230V
  
  
  annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Rectangle(extent = {{-60, 60}, {60, -60}}), Ellipse(extent = {{-40, 40}, {40, -40}}, endAngle = 360), Ellipse(origin = {-19, -1}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {1, -1}, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {21, -1}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Line(origin = {-37, 12}, points = {{-3, -8}, {3, -8}, {3, 8}, {3, 8}}), Line(origin = {-37, -12}, points = {{-3, 8}, {3, 8}, {3, -8}}), Line(origin = {37, 12}, points = {{3, -8}, {-3, -8}, {-3, 8}}), Line(origin = {37, -14}, points = {{3, 8}, {-3, 8}, {-3, -8}}), Rectangle(origin = {0, 35}, fillColor = {149, 99, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 5}, {4, -5}}),  Rectangle(origin = {0, -35}, fillColor = {149, 99, 0}, fillPattern = FillPattern.Solid, extent = {{-4, 5}, {4, -5}})}));end Steckdose;

  model E_Motor
  
  
  equation

  
  
  
  
  end E_Motor;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Modelica_Gruppe_3_Flaschenzug;
