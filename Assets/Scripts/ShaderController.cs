using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ShaderController : MonoBehaviour
{
    public Material material;
    public Shader shader;
    public float speed;
    // Start is called before the first frame update
    void Start()
    {
    }
    private void Update()
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            material.shader = shader;
            transform.GetChild(i).GetComponent<Renderer>().material = material;
            transform.GetChild(i).GetComponent<RotatingController>().speed = speed;
        }
    }
}
