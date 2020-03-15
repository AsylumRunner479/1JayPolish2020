using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shooting : MonoBehaviour
{
    public float damage, range, attackSpeed;
    public Camera cam;
    public LayerMask enemy;
    // Update is called once per frame
    void Update()
    {
        attackSpeed += Time.deltaTime;
        if (Input.GetMouseButtonDown(0) && attackSpeed > 0)
        {
            attackSpeed = -0.4f;
            Shoot();
        }
    }
    void Shoot()
    {
        RaycastHit hit;
        if (Physics.Raycast(cam.transform.position, cam.transform.forward, out hit, range))
        {
            EnemyAI enemy = hit.transform.GetComponent<EnemyAI>();
            if (enemy != null)
            {
                enemy.TakeDamage(damage);
            }
        }
    }
}
