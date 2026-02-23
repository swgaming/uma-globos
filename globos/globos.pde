class Globo
{
  float x, y, z, vx, vy;

  Globo (float _x, float _y)
  {
    x=_x;
    y=_y;
    z=random(-200, 200);   // <-- NUEVO: profundidad
    vx=random(-0.25, 0.25);
    vy=random(-2, -0.5);
  }

  void update()
  {
    y+=vy;
    x+=vx;
  }

  void dibujate()
  {
    pushMatrix();
    fill(255, 0, 0);      // <-- CAMBIO: col no estaba definido
    translate(x, y, z);     // <-- CAMBIO: ahora sí es 3D
    box(20);
    popMatrix();
    //rotateY(frameCount * 0.02);
    //rotateX(frameCount * 0.01);
  }
}

ArrayList<Globo> globos;

void setup()
{
  size(800, 600, P3D);
  globos = new ArrayList<Globo>();
}

void draw()
{
  background(174, 212, 242);
  lights();
  for (int i=0; i<globos.size(); i++)
  {
    globos.get(i).update();
    globos.get(i).dibujate();
  }
}

void mousePressed()
{
  globos.add(new Globo(mouseX, mouseY));
}
